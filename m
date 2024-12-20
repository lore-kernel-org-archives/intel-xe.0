Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7417E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 19:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8029C10E2D0;
	Fri, 20 Dec 2024 19:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSe6FZrn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF1E10E2D0
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 19:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734724475; x=1766260475;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=yWqnMC1CbvZdQ8TeizB4D3jungTF3OsMlqOdKaIJRWI=;
 b=nSe6FZrniF4/7L5uh8rl7aFCmA7n8yOSCCBSUeOaanVH8Q/BaU9MJODg
 B4jdSzYGxfk9UfAIxFmEalCj4g23BlhWqFBBUau18B9fVFp+On85irlNP
 IAfwqJmFMweSmhQ5ZZO6/Mth7s9ApxH+Jbcjwmr9PfggnWzp3yMAg3ms1
 Vjiazm82Iv0Ag/sCJQ6KBCtcc1TyURlYX9oWknhfK7kPHyu/2YqklsZ6/
 K0mZ7AhmGQ2L+tUAk+EZ5JhaTL2yBi4s5BgLKnjb35Lrc1k3m+VUvpwjG
 IkiOEboKFnKpiRGtHXTC9lDFLlbdTnXg8TgboSRpkbJsU1LLG831Wt58a Q==;
X-CSE-ConnectionGUID: 3egokDr1QHyBjeuw8auYgQ==
X-CSE-MsgGUID: caY06yFQR4qEcsAokhkUBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35173534"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="35173534"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 11:54:35 -0800
X-CSE-ConnectionGUID: /NE9QcntRZGkIpKd7nrlNg==
X-CSE-MsgGUID: oNg9HryrRYSH+Cvmdmhegg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121876119"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 11:54:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 11:54:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 11:54:34 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 11:54:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTVp54L7yO7S2XwhtRCXLSa/5lgG0/lKGFYWkUGcThITFzC16Wr1DZYkebcFDsAbD/qHDQkhezYLgiDvhKFsyghrlL4ugrDTN5kj+I4SSoNKqKG12IUeQwN+dnUeNYLasb2apNCSlSM1921YzmSwt6Up/cnwwE/Ia+MC9U2UJi/6P/AbLSxF/SIalXkTKA7Nm0icGCi1mI8CplSLNdvMMRlCEHHvPYW6HSrKiyQ1ikaz4MY4MYPNRQYU+ZIPy1zTRxiG5TL7EJCOqDbp8zT6ukKg61qVrpn4SYGIBiL9UZJT/tmWwfnrwzwdtiweaSC/1t+mIUeDiTHJwuDYXbUjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWqnMC1CbvZdQ8TeizB4D3jungTF3OsMlqOdKaIJRWI=;
 b=QaPOrLBsf5xxJ2uPpLJchLoDNG2GTr+NxWMid3TcnS6VZy8LAMpsgyWot50VnbAPyKepsHAvzVqj0Xyb6Dw5BGUdtQULaikbVNqkKXB/Pc2SLw8mdzs4BsIOxv2PpLC0yYWNsetaD34s16Sb1o9NzM5aHOT4zseYs89V2n8uFyyyaXrsOhrKkJq6XCcRPqoQRxNjuw8SJTwAlpYUedB4JawqoiE8fhZBQpz99TXCMxoq++s/0m9rJa9grpZScNzoNfhWPYnfEct8Uu118nLyt5ZfL05dckTUYrzfCWpXtB60Omx3spw0HFI6/iXVP2+INbhA1x0ueyJX5WUpofdjVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 19:54:04 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 19:54:04 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dixit, 
 Ashutosh" <ashutosh.dixit@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v5 0/2] Fixes for MI_REPORT_PERF_COUNT
Thread-Topic: [PATCH v5 0/2] Fixes for MI_REPORT_PERF_COUNT
Thread-Index: AQHbUwNdcMBAJozRaka3GGJDoNbMdbLvi82A
Date: Fri, 20 Dec 2024 19:54:04 +0000
Message-ID: <d4f89ead15c16e232681fcf96fb1a0669b0d2249.camel@intel.com>
References: <20241220171919.571528-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20241220171919.571528-1-umesh.nerlige.ramappa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MW4PR11MB6763:EE_
x-ms-office365-filtering-correlation-id: 78546fca-9417-4539-6483-08dd21300e8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SlBicmR6SDJEdGFPUHM5M1UyOG1PMWZWaFEyQTFKcStPdThCZGRMUlB5NDl6?=
 =?utf-8?B?dnZKSlNwVGZ1MzlKRzR5cTFEdWFlbkxiZmFrQVFIek9qSitNY1lON08raDFo?=
 =?utf-8?B?ZEN5bVo0SitJcm5Yc2FBNXJ0UEo3Ulc5OThNUFRqbytPSnA4OFMzNzlTeXJW?=
 =?utf-8?B?c016K3pqVDdidTNPWGFTN0tQeFE2SWJhQ0dKUk5HYmJwOG1OcVAxWEgrV3I5?=
 =?utf-8?B?ZWxZZnRHNVM1dnBjVWw4aVJOSDh0MHYydy9GSTJKa1JaU3FTaDNzNTh0SGhr?=
 =?utf-8?B?cVZKOWFCQXB3VkovMzRNb0hpaUpoczU5UitOb2tHaWtyOFdCNk5OZkkzazBv?=
 =?utf-8?B?aXBXaTE5dVpYZEtGYlFDV0FHUjBTZ3lqOEZLZGJSMFVXUDZWMS9lMVdXYkZr?=
 =?utf-8?B?YzdZbXhCZm1Hcks1Q093NmVwNEU4Wm90ektqalpnR3k4MTZzaCtLY0V3ZEx1?=
 =?utf-8?B?WXRNb0U5azZRL1lFRUZnTnkxQmVEVnAwUVdNeEZsRDVjV01uZWpTSHFiWVMy?=
 =?utf-8?B?QmlzUjFMclV5VC85NDgzMkN1bVBGOWZ3NjkzeU1UTzljQWx5TkhRWTgyVUE0?=
 =?utf-8?B?UkovOGdOTUlVczRVUmJteWphNFJYbVFWR2xxRzcrSUZiVWorSHhnbC8zSWhF?=
 =?utf-8?B?eUdrd3NRd0FnTERmNE5IT29CTWpHcm5WVWJZNi9ncjZNN2x5MHNMcEtrR0Rt?=
 =?utf-8?B?U1Yzam02dXQxdks5SUt5c1czSlNmNFNjV3JIazhNandJMVR2UmVwS2dZRnlF?=
 =?utf-8?B?TFp6eXpObjN0YzQvVDhLVzVrZnZmdGp5U0JPZG5tZk93ZXpOMTJUQkE5TVY4?=
 =?utf-8?B?bUlPZGpHQlFoYy95QVJTMzh5emdsTk54YUJBVFZtYnRUcmd3YU9VcDdwZlQw?=
 =?utf-8?B?Mjk0cExUQjdZWUZaSVNOalJONHBQZnlQTUxTTHR3Y01ZZThheDVia29mZisy?=
 =?utf-8?B?d2d4UjRIdFhmc05selpWOUpqNS85M3g3ZlNja3doY0pIZnErTWdOUVJ5dnZ4?=
 =?utf-8?B?N0ZzQ1hhSTY1aTEwN1VNNXdMUVlrWXdSaXh6d09VK3VzdjFjYW9uR0QxdmFn?=
 =?utf-8?B?bEhtT3VocTJBMUtxRm9nMk1UbHVQclBzVnBpUTFZUXhTaEw2cDMzTXN3MFo2?=
 =?utf-8?B?MXVCbmZ5U1JGeFVhcmVZVjBLQUtSd0lEVnYydUZTT2RHbWEwWC9JUUlQZ29v?=
 =?utf-8?B?Q2hTU0xVWWh4VUZuMTA1WUZlN2RDdERVSU50ai8zZjRqTVl3TlJINXRic0Fy?=
 =?utf-8?B?d0c0MTJuMStUVGVPcEVmbCt1VnVPcGF3a0plS3lJaktENFN1RmxkWTE1WkJ3?=
 =?utf-8?B?dXJXYTRjSWl6NVZrdGk3aDFMUTJDN0VMbHozdno2UHJQcS9vU3dpb0h4OGRo?=
 =?utf-8?B?Vk5idVZuSkVXZGU1d0wyNVlOaUhzcWRUSGROOTV2aXlvaVlVeUVWeWR1VjYz?=
 =?utf-8?B?YVBRR0JNK2FNTVdMTVF1U1F5U3VJU1NVbklMQ1RQaFo4T0pTQjhQNnJSSHBW?=
 =?utf-8?B?Mkh4TityNUx4RFRPV0VVMXVMR0ZzVzZMbFp4MjZ1cWdlQUY0OSsvWW5xY2Yw?=
 =?utf-8?B?RXJteUFLMkxTcDRmSDFNNkI4MUE0MG5jY3RYN1pxcW02dHowWGl5VFh4LzBR?=
 =?utf-8?B?OUhsRDA4blY3R3VuRiswM0dvMDNYSG9HSkdFVEk3TXByK25ZSWUwamw1Z3l4?=
 =?utf-8?B?RUZFOU5zdGg3cHVlREM3M1NneE1LMTlSbG5vQkpIQnlLQkRlQ1NhVWNSZnd5?=
 =?utf-8?B?RTBUV29CT1QranZGR0NIb01zc3A0enJ2WmFkaGZjdFZTVG9LeW5QbmtDVzhS?=
 =?utf-8?B?R0JjQ3BUSnllQ2c4QU5YbzBPMjRQYmlmWjcvYnlCOUJDdXVrcW9JVkhFR0Ro?=
 =?utf-8?B?KzlKcTU2T1BqQTVPUGRtakhNNGtwYUc1RWhwaEk5a2E2bk1VVW9qV1lYZnBh?=
 =?utf-8?Q?hC9xoTCmL8I0TDxIbJiuZ0xgnThfw545?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b01WTXV5RE1iOGs4b3YwanJiK0F4MzE5ODN3bUFKcGxsaVRZK210eEdyM3RD?=
 =?utf-8?B?MkxLMXl6bFM4YUdnU25aZ08vOXBLemJrSEV6UjNOSWU4ZkNPMkEzM1d5cVk3?=
 =?utf-8?B?akVGVnZVV2FuY2F1VjZSYUZaejVDaU8ycThQSVhqcVVUUUtDTXd5ZDBySWcx?=
 =?utf-8?B?c3lYSjJPRS96UFRYUS9yYnBLUkVwVzlRUUlDakFKUmYwTTNpSG1VK0tzMzNj?=
 =?utf-8?B?VTN3WHF1TkpTM2ZITkNiemZmOFNidExmRTRId2Z1cjBKSlA1dGRsWjFvWXhh?=
 =?utf-8?B?d3ZpMWViZFU2cFZYZzQrV29GeDJJTndxYUI5ZndMNXBVemNVK08zeXBPTlVN?=
 =?utf-8?B?OVRFSDBOZkwrK2ZEelZZdXBkRHdnVmVtNlFwZ1VtSU4weURkV0NrV3lSM2ho?=
 =?utf-8?B?SmlMaG1RS1RyTkI0MEk1VGh1SlpzUEp0YTRjUW00Ky94RXdtMEs5ZDJQMTNJ?=
 =?utf-8?B?T0o4K3g4bWdEQTdHU0ttaFdLLzUyUjE2T0pwSTQ4RDJORElkdlFOejRVSlY5?=
 =?utf-8?B?U3d5eC9oaWhPRndKaEZyTzJ6MHdjMmg4cm9WWXZ2Z1EwZ1FoMUhEOHh1OU9X?=
 =?utf-8?B?T0NyM2s3R0d4ZVZrR2JacGtLRkNBd0lPbGJjeGxmUVpNbkZHMUJTQitXbFdV?=
 =?utf-8?B?M2lzQkZRZE9GMTc2aS9OYUd5SndJdjdROVZzdFBWME4xbStLem9mT3d1NUVH?=
 =?utf-8?B?cmhqR0NhSUs2c3U3cy92T2kxRStIcjNSSmVsNmZwckFDWW92Yno4Nks4bXJB?=
 =?utf-8?B?RittQ2lkbW1oSkVUQXNvQ09ZUStyemo1N2RpT1g1VStuZEpBWUM5YzFEaXlj?=
 =?utf-8?B?NFRvNmVoVUxmNm1TZmVhcmpSWlc0ZHV6bUZhQTcvbEJ4Z2d5VWF0L3I3Qkdh?=
 =?utf-8?B?bDBLQU9HQ2pyZk1PcjdWcTV6bmlZUGN2bUFFejA2Q0FKWDdTcnZUVGtmWUU0?=
 =?utf-8?B?MTRiTnN2UHBhZmNidGFkcmVXT1NSN1N2VndoZnRidm4xbGhVN0lMRnJ5K3k3?=
 =?utf-8?B?cmxMQUhpYzBJdDhud1dFNjhtcWVpczZnZUFtektDczhCbURST2duNDh3SXNw?=
 =?utf-8?B?UjV5OUluK0tiUlFqRDNSM1J6UVE2anpLd1cyYTlYem9vSFVyUjJDcWtYTjU2?=
 =?utf-8?B?N21xdVQrM0lYTTRIN1ZuSnRKOUF6QXpHWEJBTjc1aDlpajR2dW5QWmtaZHN5?=
 =?utf-8?B?U2JVK205cnVybmFQNS9BMDNTVWNGZ3RyZDQralZvYngvamVGajN5bE1nUVJY?=
 =?utf-8?B?S3FXSStCdXVrWHh5MVViYmFNQ3JQaW94RjRQZ2p2YjQ2a0pJdG9XZGdHYVI4?=
 =?utf-8?B?Y3U0cWdBQnB2c1JleTlnemlJaFVHejZjaktrQVFOcHFDYWxMSVNtc3I5VmpW?=
 =?utf-8?B?ODA4QXQ3K1VHei8rakI4T09aM0RhVFNXTHlLMFFnSzEzUlYrakx0TmxDdGhZ?=
 =?utf-8?B?clZNQys0dzBZaXljMmFxQUs1UTRQcWgvKzBMTWhtblBDVXJNRGs3eFVvRDlS?=
 =?utf-8?B?V3BTazBrVlFkOWRkaFJEU3ZYR0dmQlR6V2xGb3BUNHB1WWZyUlU2cWNoSlhE?=
 =?utf-8?B?ZFplY2xYL1BVblpVNmZ1djc4S2hkZ3JQNWgwcmdMeDlJUU9RZDI3OXFBaTdT?=
 =?utf-8?B?eml6S3BjNnNuSUtkMWpXV3NIU1JoR2VWSk5HRmZqSzRiNFY0TDZTVGpER0Rs?=
 =?utf-8?B?bmlxZzR4bzhSSzZVVUx4dlFVa1BxWmNBN3NlTk1EbkRnUHJ2V2dzNHhzQnNX?=
 =?utf-8?B?QkxvNlJkanRRTmsxQnBVdThoejMrV3c3c3BNcis3M25HUkVYZXFXRFVEdzB1?=
 =?utf-8?B?V2h6K2E1K2pBNjFSdTBsZlpQbC9zeGVwWWFPZ2xZcTlLdForYmRQUml5OXJn?=
 =?utf-8?B?Q0dPNkNBNzg1cHZiYXdBUzk1eHBHN21WTitLMTh3UUxGOXJobTJBNk5GS0VF?=
 =?utf-8?B?ejl0RnZCNERTdFhtL1ErUzhacTZ4UzdCWGdzNnh0VWx0dHc0Rm5lazVwQ0Zs?=
 =?utf-8?B?OU9hcGdqQlJSQStyRlByeHZJeGUzN0NDUlB4dklNSVhINjllNitCdXYyVWVC?=
 =?utf-8?B?alZCbXdDWU9rS29oME51ckJXRWRxY1ozTE1xSDduRVEwSkh4OFRxRnZRY25T?=
 =?utf-8?B?REhhVXVyZGVNVnVpdkllU1NUSThPTkVyU21VYlBGRmFzcWZ0Q2FUK0xkNENu?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF06D563725850438D131D67E872E162@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78546fca-9417-4539-6483-08dd21300e8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 19:54:04.2789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDA33KPUA5jTfD96UeB0GVfaiW9tmyfT1ci3gF8f3EuWioxoB6RTn1Ad6G3sz6jdUhQtMLDQP0LC1b3aeLQnyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
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

T24gRnJpLCAyMDI0LTEyLTIwIGF0IDA5OjE5IC0wODAwLCBVbWVzaCBOZXJsaWdlIFJhbWFwcGEg
d3JvdGU6DQo+IE9BIHByb2dyYW1taW5nIHNlcXVlbmNlIGZvciBxdWVyeSBtb2RlIG9yIE1JX1JF
UE9SVF9QRVJGX0NPVU5UIHJlcXVpcmVzDQo+IG1vZGlmeWluZyBzb21lIEhXIHJlZ2lzdGVycyBp
biB0aGUgc2FtZSBodyBjb250ZXh0IGFzIHRoZSB1c2VyIGV4ZWMNCj4gcXVldWUuIFVzZXIgcGFz
c2VzIHRoZSBleGVjX3F1ZXVlIHRvIHRoZSBPQSBpbnRlcmZhY2UgYW5kIE9BDQo+IGltcGxlbWVu
dGF0aW9uIHN1Ym1pdHMgYW4gTUlfTE9BRF9SRUdJU1RFUl9JTU0gdG8gdGhpcyBxdWV1ZSB0byBt
b2RpZnkNCj4gdGhlIHJlZ2lzdGVycy4NCj4gDQo+IFRoZSBPQSBpbXBsZW1lbnRhdGlvbiBzdWJt
aXRzIGEgYmF0Y2ggbWFwcGVkIGluIEdHVFQgdG8gdGhlIHVzZXIgZXhlYw0KPiBxdWV1ZSBhbmQg
aGVuY2UsIHNvbWUgcGx1bWJpbmcgaXMgYWRkZWQgaW50byByZWxldmFudCBjb2RlIHRvIGVuYWJs
ZQ0KPiB0aGF0IChhcyBwZXIgc3VnZ2VzdGlvbnMgZnJvbSBNYXR0aGV3IEJyb3N0KS4NCj4gDQo+
IHYyOiByZXZpZXcgcmV3b3JrDQo+IHYzOg0KPiAtIHJldmlldyByZXdvcmsNCj4gLSBvcmlnaW5h
bCBwYXRjaGVzIHNxdWFzaGVkIGZvciBwb3J0aW5nIHRvIHN0YWJsZQ0KPiAtIGNvZGUgY2xlYW51
cA0KPiANCj4gdjQ6DQo+IC0gcmV2aWV3IHJld29yay9maXhlcw0KPiANCj4gdjU6DQo+IC0gbWlu
b3IgcmV2aWV3IHJld29yay9maXhlcw0KDQp2NSBmaXhlZCB0aGUgb29wcyB0aGF0IEkgZ290IGlu
IHY0IGFuZCBhbHNvIGZpeGVkIHRoZSBHUFUgaGFuZyB3aGVuIGNsb3NpbmcgT0Egc3RyZWFtLg0K
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBVbWVzaCBOZXJsaWdlIFJhbWFwcGEgPHVtZXNoLm5lcmxp
Z2UucmFtYXBwYUBpbnRlbC5jb20+DQo+IA0KPiBVbWVzaCBOZXJsaWdlIFJhbWFwcGEgKDIpOg0K
PiAgIHhlL29hOiBGaXggcXVlcnkgbW9kZSBvZiBvcGVyYXRpb24gZm9yIE9BUi9PQUMNCj4gICB4
ZS9vYTogRHJvcCB0aGUgdW51c2VkIGxvZ2ljIHRvIHBhcnNlIGNvbnRleHQgaW1hZ2UNCj4gDQo+
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfb2EuYyAgICAgICAgICAgICAgfCAyMjQgKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfb2FfdHlwZXMuaCAgICAg
ICAgfCAgIDMgLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMgICAgICAgIHwg
ICA1ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfc2NoZWRfam9iX3R5cGVzLmggfCAgIDIg
Kw0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCAxODMgZGVsZXRpb25zKC0p
DQo+IA0KDQo=

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA7DC021A4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 09:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579DA10EC32;
	Fri, 14 Feb 2025 09:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crmqqW8Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532AC10EC32
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 09:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739526653; x=1771062653;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dnOajaqnEiNUw/xCS0dcEZHHiShO+lK+Teq+xjFwxbg=;
 b=crmqqW8YlL93b98SC0/gge/jacgrrw0YbQYnzP6IMTOp+gJxe3tMmQ5g
 03DSr1DF3QXboFZ5QtWECE5YMtVEbd+fMMzUzKCoKIB8fCOsbUT+Djm82
 UOkhT5amBR+apF2ABDMmvRWOwp9AvXiCLkTDadHS39A+NNmtAqc+X4PkE
 iVg6+z1DO3LzM/A4LvUaZkayTrgo5eGJ000A5ZmVaUlkNeSSdS/is8wh6
 jvPIoypNKGTS1oqQ3oye58G7quS8tdVj2BNmD8f0j/b7Z5DhYOYZkrNnB
 ZcHxllI36tIMEGu0yohIJUhgXnRZA3WwqojWDtO97gzP3+imWq1E8VMVx A==;
X-CSE-ConnectionGUID: SU2azcbfSvamWeXLz2ORQg==
X-CSE-MsgGUID: +gSO8U8gSt+mSTQHHtzR0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40415528"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40415528"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 01:50:52 -0800
X-CSE-ConnectionGUID: BUFmZXxzQia39duH6SV9tA==
X-CSE-MsgGUID: riRsIuWNQCi5csGiBRqkGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117543149"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 01:50:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 01:50:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 01:50:50 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 01:50:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsN4Cr2WiqnwZNKClXwjKA6QwYK7Q92yBgX8HkMubUeyn+Fcn7Z+YmSHrxIbOUif8yjZ8VpFJThVQ0IvXsZBtZ2EFEGgyHKT356LsiFD8pPt2CWjmxRDlazz7fVLodUQCL6CX8VNLq29wG/eOiIs+clOXceY/X7pavKZzY+WITK1IY3wZmUVxbskjrzPEsrwMpcNeLu78b3n+GrqNSulXwT4Iti4BjzrrTIc9D/pc7s8ymGo/xhivr3qKUahc/bTGxqnZLqKRd3W2AF15fKgQ3C2Tv2bxzb9eeBvIbsLgz6N8QF9kcwh0rWb4oT868iY3PfEOjlzHM7nCpmBKJkaug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEg6H0+HOUqSzTi+EuP0p+cS5MRmrifyF30JE6NlICo=;
 b=QPVgVg00nffW5Z+HHYOYIAJqKgTv33EPDDkoD2gaI0G1WbJQRn2tAXnyc58y1P4P5h4spe/9A+oU1YDjm02y6bQ4hFPjGlF+K/5XvKy3GRKrlT+Hh/zefh3YzlbP2BBE3fwZsjm1vJgn5fVmCRDcWbwl7vSTqLz5lTro6JqTkUDj4NCObewn59GZfVUU/ZKfOSpUTXw2rnX/C7fP/8AP30BCkxvedqFFuV/gn+LpPWO7KzJJdVfW2yEIlcg4OUDqCQNusZDFYunWZIP6psjECn3JFuYRVfqaqODPGYgrsJNE1jyudfDF8PL5ltFygU1GDp+8cUyiZWIHGoxs8v03rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8211.namprd11.prod.outlook.com (2603:10b6:610:15f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 09:50:35 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 09:50:35 +0000
Message-ID: <239044cc-cfe1-47fe-8565-c33cde2afc64@intel.com>
Date: Fri, 14 Feb 2025 15:20:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] drm/xe/xe_pmu: Acquire forcewake on event init for
 engine events
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250214100819.798544-1-riana.tauro@intel.com>
 <20250214100819.798544-6-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250214100819.798544-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b9129ad-9c9d-4eef-20da-08dd4cdd070f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0tWaVhydVJhVXhLeTdzQ25Oa1lDMGRLaTEvLzBSN3VGN0FvVUZWUllBYmdC?=
 =?utf-8?B?WjVKTHhkdHVUR0RBRHVFK3JndmVqNnh5ZGtzeUJOSzV5bG5tQk5GSDhCWXBN?=
 =?utf-8?B?TFZhaUhxbkZucWU5ZXBLbWwyWlFteGVkcHBjR1ZEZUUzdzE3OThDeVpCUWdG?=
 =?utf-8?B?ei9uNVZxakkyZ2RjNjRFL1d1bUVYdDZiV0NBOTNuWjZhNFJZU2tmUitPWjE4?=
 =?utf-8?B?NGxYaE83QUZzSXh3MnZxa1Z1TWR4WnRhRFMzR0dublRaM3ZJcmFoQVA1c3du?=
 =?utf-8?B?Z3FraVlWZjkyTzZxY3cramdKTWFRSmk4Mm9UdUJRVUM1ZmNSdmFHZHBaWWpZ?=
 =?utf-8?B?aVlJOVhrMzhDVlFyOTdKWVV6TzBGYzY1d1dEYnpUVnF6NmNQdTNvQzJydldE?=
 =?utf-8?B?TG1nVXYydXdpcWN4MEZxamZUV2l5SDBteUlqa1JGbXMya3BGMlk2M3IvYzNj?=
 =?utf-8?B?UGQxNFQxcFhESkFDaGFvK21JakVNekpoWnU1L2FwVUtpMTlIOGRyNnJPS3No?=
 =?utf-8?B?YmNZQzZVQWNXTmJFK3p1OTg5dG9hOWJwZnNoT2dBOHFHaFB0NlJod2hpaFVR?=
 =?utf-8?B?bzlnQ1YvdW9COTBRVHNuV0xaTUl4VmFlRlc1RlJINVhRZ0hZZllTeUZVNWQx?=
 =?utf-8?B?TkhKWHN3Sll3SmFQMG5ibVQ0V3NlelJFbmc4dXFRVmZzcE1RRnVGdXpmRnZn?=
 =?utf-8?B?bmY0OFB1b3Awb0RPS1BuNmEyaFhkTVdjanEvdWJyR0dGRkVsajVldW5jZkpk?=
 =?utf-8?B?M2NjdWM4ZzB5UjRDY0c1Vlo5OWlYdERkRzlnNDRXOXIxdDZyOExkeVFGeGlC?=
 =?utf-8?B?eTNZZ2ZzQ2lmRkc2TUtkbDZmWnpVMzA1SUZCaHpDVmNKNXViQnFnTENCSHRV?=
 =?utf-8?B?OFgwaUlnUlVVYkdjY0FSQmtFQWFiMWMzV0VhQlN6SG1WOE1neUhWdzFMVGZl?=
 =?utf-8?B?aDJkU0FFWnpncGZHV25vMXhZcWZsN2xkOUowSWpqdU1zYjdTeVY1R284cUhJ?=
 =?utf-8?B?ZzIrRitiYWVwRlBVWWZ3Mk9vSW1XajdRTVVseUIrYkw4UWdIR05ma3plRXJT?=
 =?utf-8?B?ODFBMTduUEdLdEZham94Rk0wSDZ0dVBCbWErN3EvRTRTTlE0clJRajJxUFE1?=
 =?utf-8?B?cEtFUzhqbXNQdXFvaTVRQ2JsQklkNE5rUHF0UDZHWEdEdDJrZnFSQzFNODlE?=
 =?utf-8?B?SVJMbUEvNWRuclZ5Mk93NnNmVEplT0lDcmJ3enpCQ2hpNjhLaEo3amMyOGN4?=
 =?utf-8?B?NzZVKzAyWDBQMXhyV3JNQ2Z0WExYMGI3QnA3MlFicmVEZ2tueTdsTUdhWnRY?=
 =?utf-8?B?NkplbEZjRHJsNzYrUUVhUWpKYjY0S01jK2Y5bHQ4ekdTU2NJUVpLZTYrczF6?=
 =?utf-8?B?eGlwbU4xVXpZK1hoQm5NZG16VW5UcnorMityeXVSdUJUUmE2QmJBcVRCdHBl?=
 =?utf-8?B?ZFM2OUJUdWl6MGlmelYvTS9oNllkQkl6ek1PbW52bHBlWmhBMHdUYkFUWEJm?=
 =?utf-8?B?VEhWNXZHUkViRmc4R0NFcDhucXgyQ3RTdWdyTGEySyt4bU1NeWd4Y1BEa0cx?=
 =?utf-8?B?elYza0tZWVovRElhYWVhSjZaWEFPWGdqcjRHcXBsU0R1NFpJWnBnY05HY1VZ?=
 =?utf-8?B?WmJlZCtYRDNhTG5iNCt4UXpnb2h3RFFBMVZXM0dEOUFYQmhOdFA5a3N3elBs?=
 =?utf-8?B?dERidXVWVEZ4bTg5TWJNVUM5NlJxRWhVZ00zbWxXenY4VmhYTXZudTEyZElo?=
 =?utf-8?B?T0U1KzdmQzkra3ZYTWUwY3dzRjZ6Q1VxZmdpNVhmNXZVU1lncU9rZHRuZFR5?=
 =?utf-8?B?bkJoblByckxrQUFSZnlrZWVka01wbXpyWXBSa3VQcTRVMHExTzIwbU9PYitJ?=
 =?utf-8?Q?JSNES0XX36EET?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTdSeHpiTmI0eUh1a3lwMjl3MzROVGRGSW9UVnNxNFpLeis0dDNBRG9PQVps?=
 =?utf-8?B?QnNJbzVDOFIwOHN6bDU3TytGZVFZQVUvSnd6Z2VQVSt1K3V5UVVORG1DelVC?=
 =?utf-8?B?NlUxbnZQOHk2R1FFdjgzY0hnSWRobHpkUUZOYnI5OURzS3drd0srNVJVclpo?=
 =?utf-8?B?MkErUWs4TUF5MTlMSURWK0RwTWJWcVNZRktOZmNsRjBuRkZoRFVFUE5vMkIy?=
 =?utf-8?B?NWs0ZnpVRGZLU0RFZVVZUTloV3BLdERXcUk4NlJmc2JNR05NdHFEV0Njd3lK?=
 =?utf-8?B?dngvbG9GSGNaTWUvLzNPYjFqcm1sam1wQnlmakd4ZmI4MVJKL2U0eS9ncmFv?=
 =?utf-8?B?TkNDamtXYjh1ZWxpdFJ6cnE3ZWkxNDlsMEFKTm52U2hFTk11a3ZiZ3QzZWor?=
 =?utf-8?B?Z1pJU1l0VHJoWlNrZVdKMHhPVjhQT3gydGd6S0tOM3NldmVlR21IUHFZMzBk?=
 =?utf-8?B?QjF6K0xUYU1JcHlmazgySzJMd2NGRkgwTmFkY3Vwd1E5eUJWYTg4cytLQUtG?=
 =?utf-8?B?ZWE4MUJMa3ExMENFUUxrSlhmSnh4NTNZMVJTS1p4WGJwU1V0VXRieEZpRGR3?=
 =?utf-8?B?MHBKUXNxTm8zUWV5L1oxa1ZUdGxybWlsUEtsTFhCVENWTDZXc2VuNDRTRXpw?=
 =?utf-8?B?NWZNSkNpRTByZXJzakZlWE5TYjhJSjhYMXd6SlRyZHNHUUh4RWkyTFdVZW5v?=
 =?utf-8?B?Z09Rc09Ha1dkNEZCK3YxdEZDV2xhS08wQUxEWnp0Wkd4V0VuOHFPZmNWbVAx?=
 =?utf-8?B?Ymc0ajU0alVPZXdyRnNod2s3ek5NQVg0NlYzc3NVRjdzUVBpRU5OZU1TZ1dr?=
 =?utf-8?B?dXRaK3lTSDBZMnhxRWRrc1RhV0ZJR0ZrNXlQK2QvWnlYVXRvZGNyY3BRRVRJ?=
 =?utf-8?B?ZS9Vc0JteThFa2hkczNZVVZFTkpveG1nSkQxQmdWQ0duZzl3ZHRSV3JSQ0U2?=
 =?utf-8?B?Z1Bnd3V1M1pmWEF2bURRdDlCdTNEMWtrVGl6d0gxQTFwOHdFb1FJUkllWFRr?=
 =?utf-8?B?WUg4YWpYUSttajlzY1VJSFUxaTM2TXhQKzVzakNkV0ZmMERWTUo5dWJ0eVE0?=
 =?utf-8?B?RDhWSUhCZkFkdTdxL1lzK1FxUmFuS21FWnUzYXZmNEVEQkhHM3hUOHloZFBm?=
 =?utf-8?B?WmlHR3JjaVRGNHVsREhOeW1ndWxOT2t6dWtNMFRuN2dVNjJSTEZGTjE2Z05x?=
 =?utf-8?B?SGo3R1Y0M1BISnFlNWg2cXU2YzlXT0lWKzY0ZDZpdUtwVVhBUDZYZ3E1VUor?=
 =?utf-8?B?VjF0MEczbjhKZFd6NmUxejdKS1JFSFhrcVRjL2JhcDRMOWdGVFJXSGNGWlcv?=
 =?utf-8?B?eE5VcXJxL3BnbVFtVThzNVl2c3h5TTVhM3IzL1NDcXJ6U0RweFV1dGNVYW5s?=
 =?utf-8?B?eCs2UHhueEVucU9rRTdtYmZXUGRVcHp1RnBPdjYrNkk0M0tybFdRK1R1Z1hw?=
 =?utf-8?B?WnJRMWE0ZnBGU29PRFlxU0theGZsU1RWVnRyaFkyaWJEZzhEZjFqRXlLeVFR?=
 =?utf-8?B?WWpTK09uWnliU2E0bTk5YjBuOG1Za3VFZmZTamZ5U05ZbndRUnN1VWxLWEhQ?=
 =?utf-8?B?b1ZWdzBIQzdYSmdrVjZUeFhBRGw2UkJDVlM2dzBrTEk0R2pGSlRodUwvZ3Fh?=
 =?utf-8?B?NWlMSWFjbldYSWFYMCtEVkFBZ3JLM1RFbGpvL1NDbXNGOU1jOWVtR25vYjNn?=
 =?utf-8?B?OUhBVU5JZnlKL0dmTHNaQm9TU0wvK2wzSDVqbEY3ZE13SndtNGtKTkw1QWc1?=
 =?utf-8?B?TlFERmp3RS94YmU5VkRVYjQvZHExbUZWbzdIK1ZrWmNwSkRkTnd6WDczaG9l?=
 =?utf-8?B?L1F5NHlxbm5zTzZtM3BEWGRMaWhaaWlhM3N2dHJ4bnhMTjBTMytlZ28xZDdK?=
 =?utf-8?B?a2xoQXBqSlg5NDg0bHJsZmk3OEgwM0hVeFJ5WHhUcktrc0xZWFRRQW40VVhh?=
 =?utf-8?B?Tk8vNEFYQ0VuN0tabVVpNisxOEgrMDI4NWVONWQ0alhlRE1lY0xuMXZXOUhL?=
 =?utf-8?B?YW03QWdscnFxdjliaXZaR3dpNHpGdUIvOWhNc2N6ZExCWXYzcDFwWUExbjFv?=
 =?utf-8?B?OUZPUkgxaW1pMlc2ckVQMmxxWWRXeGlIVlRrQ0hpb1hIajNmOWFNbnhrZlZN?=
 =?utf-8?B?b3hKbGg3L3lpcTNBaU50dFpMamp5VE9QRkgxUHFKTjlxR20vcTkyck5IM2pV?=
 =?utf-8?Q?ff18HfwbAw5P6GQFhvib2Ao=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9129ad-9c9d-4eef-20da-08dd4cdd070f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 09:50:34.9529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ajhvsd6RaSDOoKzn6dy4ECH9xH/1Mrhvf7k8d7bf8sKY+zOvLm+6zt+DuKaiMgRspopEKXFOE5B2Ac+jA9U6boy063eufDo1lZud4X4Putw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8211
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



On 14-02-2025 15:38, Riana Tauro wrote:
> When the engine events are created, acquire GT forcewake to read gpm
> timestamp required for the events and release on event destroy. This
> cannot be done during read due to the raw spinlock held my pmu.
> 
> v2: remove forcewake counting (Umesh)
> v3: remove extra space (Umesh)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pmu.c       | 52 +++++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_pmu_types.h |  4 +++
>   2 files changed, 54 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index dc89fa6d0ec5..67693d642f5a 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -7,6 +7,7 @@
>   #include <linux/device.h>
>   
>   #include "xe_device.h"
> +#include "xe_force_wake.h"
>   #include "xe_gt_idle.h"
>   #include "xe_guc_engine_activity.h"
>   #include "xe_hw_engine.h"
> @@ -102,6 +103,37 @@ static struct xe_hw_engine *event_to_hwe(struct perf_event *event)
>   	return hwe;
>   }
>   
> +static bool is_engine_event(u64 config)
> +{
> +	unsigned int event_id = config_to_event_id(config);
> +
> +	return (event_id == XE_PMU_EVENT_ENGINE_TOTAL_TICKS ||
> +		event_id == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS);
> +}
> +
> +static bool event_gt_forcewake(struct perf_event *event)
> +{
> +	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> +	u64 config = event->attr.config;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	struct xe_gt *gt;
> +	unsigned int fw_ref;
> +
> +	if (!is_engine_event(config))
> +		return true;
> +
> +	gt = xe_device_get_gt(xe, config_to_gt_id(config));
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return false;
> +
> +	if (!pmu->fw_ref)
> +		pmu->fw_ref = fw_ref;
> +
> +	return true;
> +}
> +
>   static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>   			    unsigned int id)
>   {
> @@ -144,6 +176,13 @@ static bool event_param_valid(struct perf_event *event)
>   static void xe_pmu_event_destroy(struct perf_event *event)
>   {
>   	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	struct xe_gt *gt;
> +
> +	if (pmu->fw_ref) {
> +		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
> +		xe_force_wake_put(gt_to_fw(gt), pmu->fw_ref);
> +	}
>   
>   	drm_WARN_ON(&xe->drm, event->parent);
>   	xe_pm_runtime_put(xe);
> @@ -183,18 +222,27 @@ static int xe_pmu_event_init(struct perf_event *event)
>   	if (!event->parent) {
>   		drm_dev_get(&xe->drm);
>   		xe_pm_runtime_get(xe);
> +		if (!event_gt_forcewake(event)) {
> +			xe_pm_runtime_put(xe);
> +			drm_dev_put(&xe->drm);
> +			return -EINVAL;
> +		}
>   		event->destroy = xe_pmu_event_destroy;
>   	}
>   
>   	return 0;
>   }
>   
> -static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
> +static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event, u64 prev)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_pmu *pmu = &xe->pmu;
>   	struct xe_hw_engine *hwe;
>   	u64 val = 0;
>   
> +	if (!pmu->fw_ref)
> +		return prev;
> +
>   	hwe = event_to_hwe(event);
>   	if (!hwe)
>   		drm_warn(&xe->drm, "unknown engine\n");
> @@ -218,7 +266,7 @@ static u64 __xe_pmu_event_read(struct perf_event *event, u64 prev)
>   		return xe_gt_idle_residency_msec(&gt->gtidle);
>   	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>   	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
> -		return read_engine_events(gt, event);
> +		return read_engine_events(gt, event, prev);
>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> index f5ba4d56622c..07c4e592106e 100644
> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -30,6 +30,10 @@ struct xe_pmu {
>   	 * @name: Name as registered with perf core.
>   	 */
>   	const char *name;
> +	/**
> +	 * @fw_ref: force_wake ref
> +	 */
> +	unsigned int fw_ref;

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	/**
>   	 * @supported_events: Bitmap of supported events, indexed by event id
>   	 */


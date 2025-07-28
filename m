Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B9CC83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 18:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2320110E569;
	Mon, 28 Jul 2025 18:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TetkXFc0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF4B10E569
 for <Intel-Xe@lists.freedesktop.org>; Mon, 28 Jul 2025 18:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753726066; x=1785262066;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=LjyChO0wO+KlB0Z/ufdsCJODRzeY9x2PI0mMarIWamY=;
 b=TetkXFc0gjrYaGlxX/Qsfq6HnMCq63zMCiQaOTk7Zyzm7oMEImArOQON
 2xrKq5gUD2WFJ/SJ01h6O+4i2QASIcOR3o+ypzc3yI2HkAfDKilm5NzXH
 2jJkup9ZIp4gsD5GnlVniEhOuaavIDEGYlGucl5StQaLJUpdsM+QQs/gT
 5Rh0LJwwj1N4db03v9yEZ5EQJ/QQFyY2aNzjqe5BYHbTFozFIfVVU6XZd
 EMZxuFJ7IR62mtUfZxGIjtWriwAklPv1J7RtzwEj6bs1Jgnr0rLmTOsCt
 5u3WD4QzFhtKg+i059UO05hQgCdBJJtdmKCpLXRwWWaTvZCmakLEaI45c Q==;
X-CSE-ConnectionGUID: eyjiNtmiTceTV7hK5+Wxvw==
X-CSE-MsgGUID: 2i38+aGYRrqF90xtxfGZRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66254545"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="66254545"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 11:07:46 -0700
X-CSE-ConnectionGUID: rOLcOfCmQEqLPfkqrxg7ZA==
X-CSE-MsgGUID: ZOmfJdTIRn6gxjGspm5TIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167792843"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 11:07:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 11:07:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 11:07:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.42)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 28 Jul 2025 11:07:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5BmnHkIj9mc1q9ne9WWaEgzFDEuIkrGXhskejRhIwLlZryoUWH3ioU2zMxNzVzSOBYpD7O1GB93OZEq1k1rwLgJKoPaW6DJyekuu2jPL6fN23X+MXb4iLZbNGX0LtkLM7aWWVEZTdvfFaXVqGjRYjLzQv8D1p/f1DVZzspctsXWiQx4ieUB/gF2bYnDSGEo1nkrVfFri7vg41VSK0hJtvRvfoeKYQ+kjpU3aigLBk5Yy2GgGFPx1IH5iuE5cb3HzKGPrBF817ODHWzTz7aJUDtK3aX3BXAoeVDpOubPVVVnC9Xco3p7KMGHkkODnLiJU8fFdVQxrHEYDNOQGNiaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjyChO0wO+KlB0Z/ufdsCJODRzeY9x2PI0mMarIWamY=;
 b=Hr2N4HRJeak4YPM1iWWJGRWG2mxoY7O/d9O7kCCM2SaWIRpiYLjMOADx98scmsVgPRok7swNEblCi8bqp9IyHFGngTPoY9bbIa1CIa5G+4H+c1q0grsBTf/vFGzRHw/DLa/TfCfJZ4oy2ZJB+/JeFZ5AthEOLEY+G+k5LmQk+ad7ay/GwBMHgNJgWUqbh7XuRktw3u7P262gel6E71lGIo0RojDgkKCi3ce4IUO4K8bcHcgIn2auLXz33rKFFAlKCwXyIzj6IqFRCpiisNIX4SfDTs3Ctb9EIvpTUYRkreXJNjBdvqcl5QCRGSSA+UP2CnYonaHvhYnPKGn5Hw1wOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB6094.namprd11.prod.outlook.com (2603:10b6:8:ab::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.26; Mon, 28 Jul 2025 18:07:42 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 18:07:42 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>,
 "Harrison, John C" <john.c.harrison@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Add more GuC load error status codes
Thread-Topic: [PATCH v2] drm/xe/guc: Add more GuC load error status codes
Thread-Index: AQHb/dcgjJzJc/FGyUygkkr6aAKPO7RH2VaA
Date: Mon, 28 Jul 2025 18:07:42 +0000
Message-ID: <04b36067f9391ca816133b9ca4b25538d6a5e8dd.camel@intel.com>
References: <20250726024337.4056272-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250726024337.4056272-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB6094:EE_
x-ms-office365-filtering-correlation-id: ad0d8190-4756-47ec-2e71-08ddce01a5a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZDFBQlpTSGlZYkpOQnhjdGdjaWY1Mi9ZekdRL3dKVFpYcGxSdXlBc1llUWlL?=
 =?utf-8?B?TlRHeWNQTlRkM0ZBZS91VGNRZGsrZnZpam9Fa3hycS9wM1UrSlo4MzFsMTgy?=
 =?utf-8?B?K2ZEV1doWEF6NFhDcHc3YkRGVnZtTEFSSFpGcXhnZkViOTBuUkptUkRnVGZi?=
 =?utf-8?B?VW9OaVYyUW55M1EzVXlEWjJaQnJ0eUp3dEV2b1hRQmRRc1BZWWNsVW9JVm83?=
 =?utf-8?B?VGUxTGc3S1lXaXRSU2hFQ2xaTm5kcE50MmV0cmpZYW43NlRuWXNmcTNobHVz?=
 =?utf-8?B?UTBGc3BQcy9GN29pT2xFejBFU283SGZuZVdQaExMcFd4U1lVWnQ3bEozb2xp?=
 =?utf-8?B?UDI5V0xqaU13dVE4V3RndjhIcVVSZ1ZhaG8zWTMrYVNmS0JZOTE4VTZ6QXYv?=
 =?utf-8?B?YnQ0by9QOXRTZDdYZmJ3VmlvWHJ6b25qK21GSnJBay9MVXFFU0d3RU9Wb2xz?=
 =?utf-8?B?YWFIUG1PZlVJamo1WUcyVkZhUXRMU00vNW1Rb2NQaDU5QUd5UkE5T05rc2ZM?=
 =?utf-8?B?KytVckpjQUhFalZ4OStlWmZBVTBCMGZSd1pSQ1R6OEF6dXcxd2N4UExCTk5z?=
 =?utf-8?B?NTJ3VUZTTStnVERSbCtPemY0QWhMT3RES0VGdXFNbFh1WmRBZWxaSWFFWXBV?=
 =?utf-8?B?NGQrSG9nL0Mzc3p5NGpLVU0vQzRIU1EySjI3Q3AzZW9wVVh5RVMzMThqQjdS?=
 =?utf-8?B?TVlBVG5pQ3g4aVQxeVdOTGZTTXduMC9mQk1MZnhGSUZVZ2tIdmlmYXJaTVRq?=
 =?utf-8?B?dnR2a29TUWlXaXlObStQZ24zbXFiS2JrTmw3Ui9LMWtXc3RaSmd3TmtDWTlp?=
 =?utf-8?B?UDk0bDl5UEFOdlpqR0Y1bGt2UjRseWo1ZllVTEw2b3hqS2tzTTd4UnB6V3pQ?=
 =?utf-8?B?Zll4NFJ6Vzd0ckgzRnZKZlpxU3BEWnJqbU5XdlZYcWRnSFBYNlVhRm5keTZw?=
 =?utf-8?B?QXA1OXBsSlcrc2M5NUYydThHV0p0elVuUjdBUjlCV1JFcHh3K2lnWXRlMVVi?=
 =?utf-8?B?U0lVaUhSK1R6bGZ3VVJqYVl4SVJETFFqSk1KZlJYSDF2RUswVUl1ZkcrZEI3?=
 =?utf-8?B?WFcwUm54cWZzVGlSSVVLbHZZQUd4RTNMQ3pLZm82dkJTQUl5Z3JKMmtyL0NI?=
 =?utf-8?B?SGR6M0Q0N1ZkT2hyQnhEZStQTkRnN3JpUndKZmVwWTZ5TmhhRG9SU1BqVlY4?=
 =?utf-8?B?UDZnMHN3bEJPQ05sTWpxS1dBampKa3NsMDh5ZGRTbm1IZ2w3SmRXbWdmT0Jp?=
 =?utf-8?B?eDE1MlR4MVZtelVBa1lUWWRiOTJwRm90dEZ0SzQrelJEbXNxRWJuOEdjaEYz?=
 =?utf-8?B?MTFTazhlT2hjN1B5KzdZd2c3OXlDWllnVlZib3RhUjFOdExKNTg1Z0IrYTRF?=
 =?utf-8?B?QVN5ZGhkTGx6SWN4ZUVpZDlUekc1MkFYbkFKdGNrazBsd2o3dlhjQWFqMWdU?=
 =?utf-8?B?OVNQYTFFMjVHNUE5N2kza2kxejhJWi9xa1I4NHlVK0xSSS9hZ3UzVmk2L2xQ?=
 =?utf-8?B?YjIzUG1aNEZrcTltL1dFZGRVMDRQODZNNEtXajdKSjFqdlpWOHJlUXpFYmcz?=
 =?utf-8?B?S3dldGplL05PZi9qRUpuTTNqZGpLV2ZkZU8zL2NlYjV4QnZ6eFNxNHhpeFFV?=
 =?utf-8?B?UEFTWWhSTGoxSkdOcEYxeUVyU3Z1bSs4TmM5blZ6NUdldytTbFRueURMNy8w?=
 =?utf-8?B?endEY3J3dU9uUklCOG8zNzZrRWZjWVJBK1lKSFZDMXN4NFQ3WU84WXFGZFp1?=
 =?utf-8?B?c2xWQ0IrZWMrMmZpSG4yV25GdGFvN0RJR3FSSmZJM1lGYXhkVm9sTlJvdkJk?=
 =?utf-8?B?NE81cUI5YUR3V3lVcGRxUXIramhXNWxkYU9VYS95Wkt5cXNybW11M0RMTXps?=
 =?utf-8?B?a0l6VWRKZ1VnUnkwd3V5SUd2VTQxTVczNGh4Q3NKN0YyQTA0SXhTa3ZDd1pu?=
 =?utf-8?B?aEpPWVgyR1ZmWE5xWU83Y0lrcGFVd1VCclgwUW5CVGFXbjJ2aHB6VHNPdDlH?=
 =?utf-8?B?OG1yRlh1cUpRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vnc5Qncrd3RxN3NUSXVQTitpd1FPb3JLa2w3ZmRJdE5WL1dNalNqakJUNWdn?=
 =?utf-8?B?Snk1Mk02VUdMcE1NWGIxNWIzdE5PcnNhcUlvak9VcTh2UDJnMXdZL0JYdnc3?=
 =?utf-8?B?UWY4K2tPdDdBanpzQVdQekZTeUdFZERhays4ME91MW5lVlBxZDZOR1VQeFVo?=
 =?utf-8?B?SVRrcW5zRUgxVStqc1hLNURZZ2hTeWdQTHpGbjBpTjFjR2pxQStVaXNoWEZV?=
 =?utf-8?B?WURDMFBwQXorT01XRmxHTGMvVTBDZFhETlJLQnBFR0tTcENWV1hGNVBqbEdN?=
 =?utf-8?B?VU5wUUxiZjhSYjVHWUkwb2RRT1k1blFXZ1RFcE43V0xXNXo5aWhMZTA4VW1T?=
 =?utf-8?B?VmlVeFFPV1M5ZWc1SVIyU09FVWtZc2JwYmNkWlN5NWJoMlJSM0dlMDhyWXRQ?=
 =?utf-8?B?c1BXM2MxMTg5K25FMTdXVENOTjRUSEJXMHc2akcvR0cvT0plRCsxTldWak1Z?=
 =?utf-8?B?SElXSGI3bUJxd0ZtOGhJTEwwa2dpN2V4dHpsTGlMc25OUmc0WEpIb2tDZ1Ni?=
 =?utf-8?B?R0JKdE5PRDcvczVXRkJMaHZORXVHSm4yYW9TcTNYOTdBNGVJbjVnWXkwY2h3?=
 =?utf-8?B?Rjd1YXBMbFlRNjY4Q3ZPYTMzZGtMaFdmbERzZVk4ckwvdnl4SnJmSVZYeHJZ?=
 =?utf-8?B?eHBwMVFHTVlxQXNtODFjRWJzYzB4T2FxNVBEY0dWN05mWFBHdDM3NVJKbThE?=
 =?utf-8?B?cytwaGJ2M1NhaWVmQ0pVL2xkdW5vcGFYMVJwLzRjVjJyc29yaXM1MkdVNVBl?=
 =?utf-8?B?akRVZG9ZbkFTbkVWQmpiOUhwRWhrVWRDcEdHa0xVMVFuSFVoc2RZWHdtczFa?=
 =?utf-8?B?Y2J4VldBcUIySjdCc1VLeU1LdEVUWWJSL2VSbjE4OFA1RmkvMmZsejJ5d0FV?=
 =?utf-8?B?NFhxRGM3ekxvQXZ1S0FIU0tSYVZKSS82TTN3VURadDA4MTZTSWhBU1c0OG1R?=
 =?utf-8?B?T0FCdGMyaGNoZFBmUHlGYjE3WTl0MnBXUlVoN2I2RGRMMUIrSVBnZk93WVRD?=
 =?utf-8?B?QlVOeGd0OGZFUU1DaG02VlpCS1VsWm5IYzkyTHBCV2pXMXhUTDFzZS9neFRD?=
 =?utf-8?B?bElpV1lPTnVLNENBeWtxQml3T3dCSmlHQ1psUUpzR1I2OFZVdlc0MVFIQk1K?=
 =?utf-8?B?QUpKVitBRGFOOHdHL3VibCtEUkZERGtpT2NqNURkL0c5V3VNNGdsVXJuWXV3?=
 =?utf-8?B?MmF1Nm02OEk4ZWZRYmNSd0M0azFoYmNIZGVYSFdXK3ZTTXRZR3I4V0kvZFVN?=
 =?utf-8?B?SmVzN0RFK0lnb3IvRGxWNGpIT0taSTVmU0t5cStEZm84RDIvVEVvMTEwTmNO?=
 =?utf-8?B?NmRJN0RXaFhjeG1mSWVncnpPZ3IwTUpLWHRjQXNsU3ZZRWFneHVEZXBEWFE0?=
 =?utf-8?B?VjdmMDMyNk5rei9SWERIMWhjSGRBRXE2aFhQUmNoM3JMdmVGY2h6TXN4dXlM?=
 =?utf-8?B?d1IzR0VjcDV3YkQ5SWdIdTREM0RQb3JncWVUU1ZPY09iNmJZSFo4K0pjUm56?=
 =?utf-8?B?NEdIQjE4cTdGZ1pSZStqVEY1MEM5NGZNWVdKSUlmZ0hRMlFqb3l1VEwzdjlV?=
 =?utf-8?B?QTY4aTYvaUhFOVJYR1dvSnBacnQramR5TFdtUHFqR3ZiL0VGNUZUc2hNblpN?=
 =?utf-8?B?VjFPUERiTWowUE9KTHVOSW4veDhva0hSUVR4c0doeWlFWUp3bDFpbVpDbmcv?=
 =?utf-8?B?eVRocGxqei9weHNLV3FCL3U0N05zQVFkL0o5b0M2SjcrS3IzUjhjRHhWaEQ3?=
 =?utf-8?B?Vkdaa3hwdnZiUlcyYTBuSEc1cllibkNPTTMrVXEyTTFaZms2THgyNnlMKy8w?=
 =?utf-8?B?SER2WjhqRDd3MEpEc0Z3QnljQWV1SVIxMHhHeFJ0N0NpWnpHamQzWHJtSFpF?=
 =?utf-8?B?cE1keDBVU1d5eCtsV1ErTXlWZlBTZnlwTy9wdnRuRmhBdjZiRlhlaFdEM2Mr?=
 =?utf-8?B?WGJrM3UwMWgvNG1JSDE3WFlWb2dkOUlaSjJBYjc2eTAvOWNlSTdVNW1DLzVN?=
 =?utf-8?B?MU1iQnVuTEZvbksvM281dlcvVkordXNJc0RGNTRpMWJlL3czQThYczNsdHo2?=
 =?utf-8?B?aHgxWWVXZnNrK0hsUWVENWFLSUZJbkczeHpDT1FyWmNEcVRPeWlEKzE1c29S?=
 =?utf-8?B?eGp0blJkS0pURmF0blYreHhBMlNBZ3VUYmZEdzg1Z2pnQnp6eGZQRTh5blVs?=
 =?utf-8?B?dUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB8295BD298C804ABD50BFCB141CAF58@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0d8190-4756-47ec-2e71-08ddce01a5a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 18:07:42.5551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fLC64kNe2BU7dUHQUl8dh+HqyyC9U0BjpwXXhsNBmXErvX91fMfSFzq8iPVu9bpecxenOTJpzXwGu46FbSgMxwNJ0F5/HfI2TKDXEscypZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6094
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

T24gRnJpLCAyMDI1LTA3LTI1IGF0IDE5OjQzIC0wNzAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOgo+IEZyb206IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5j
b20+Cj4gCj4gVGhlIEd1QyBsb2FkIHByb2Nlc3Mgd2lsbCBhYm9ydCBpZiBjZXJ0YWluIHN0YXR1
cyBjb2RlcyAod2hpY2ggYXJlCj4gaW5kaWNhdGl2ZSBvZiBhIGZhdGFsIGVycm9yKSBhcmUgcmVw
b3J0ZWQuIE90aGVyd2lzZSwgaXQga2VlcHMKPiB3YWl0aW5nCj4gdW50aWwgdGhlICdzdWNjZXNz
JyBjb2RlIGlzIHJldHVybmVkLiBOZXcgZXJyb3IgY29kZXMgaGF2ZSBiZWVuIGFkZGVkCj4gaW4g
cmVjZW50IEd1QyByZWxlYXNlcywgc28gYWRkIHN1cHBvcnQgZm9yIGFib3J0aW5nIG9uIHRob3Nl
IGFzIHdlbGwuCj4gCj4gdjI6IFNodWZmbGUgSFdDT05GSUdfU1RBUlQgdG8gdGhlIGZyb250IG9m
IHRoZSBzd2l0Y2ggdG8ga2VlcCB0aGUKPiBvcmRlcmluZyBhcyBwZXIgdGhlIGVudW0gZGVmaW5l
IGZvciBjbGFyaXR5IChyZXZpZXcgZmVlZGJhY2sgYnkKPiBKb25hdGhhbikuIEFsc28gYWRkIGEg
ZGVzY3JpcHRpb24gZm9yIHRoZSBiYXNpYyAnaW52YWxpZCBpbml0IGRhdGEnCj4gY29kZSB3aGlj
aCB3YXMgbWlzc2luZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEhhcnJpc29uIDxKb2huLkMu
SGFycmlzb25ASW50ZWwuY29tPgoKR3JlYXQgdG8gaW5jbHVkZSB0aGVzZSBtb3JlIHNwZWNpZmlj
IGVycm9yIGNvZGVzIEkgYWdyZWUuIFZlcmlmaWVkCnRoZXNlIGxpbmUgdXAgdG8gd2hhdCB0aGUg
R3VDIGlzIHNlbmRpbmc6ClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1l
cnNAaW50ZWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9hYmkvZ3VjX2Vycm9y
c19hYmkuaCB8wqAgMyArKysKPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDE5ICsrKysrKysrKysrKysrKysrLS0KPiDCoDIgZmlsZXMgY2hh
bmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL2FiaS9ndWNfZXJyb3JzX2FiaS5oCj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUvYWJpL2d1Y19lcnJvcnNfYWJpLmgKPiBpbmRleCBlY2Y3NDhmZDg3ZGYuLmFkNzZiNGJh
ZjQyZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvYWJpL2d1Y19lcnJvcnNfYWJp
LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvYWJpL2d1Y19lcnJvcnNfYWJpLmgKPiBAQCAt
NjMsNiArNjMsNyBAQCBlbnVtIHhlX2d1Y19sb2FkX3N0YXR1cyB7Cj4gwqDCoMKgwqDCoMKgwqDC
oFhFX0dVQ19MT0FEX1NUQVRVU19IV0NPTkZJR19TVEFSVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA9IDB4MDUsCj4gwqDCoMKgwqDCoMKgwqDCoFhFX0dVQ19MT0FEX1NUQVRV
U19IV0NPTkZJR19ET05FwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAw
eDA2LAo+IMKgwqDCoMKgwqDCoMKgwqBYRV9HVUNfTE9BRF9TVEFUVVNfSFdDT05GSUdfRVJST1LC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAweDA3LAo+ICvCoMKgwqDCoMKg
wqDCoFhFX0dVQ19MT0FEX1NUQVRVU19CT09UUk9NX1ZFUlNJT05fTUlTTUFUQ0jCoMKgwqDCoMKg
wqDCoMKgID0gMHgwOCwKPiDCoMKgwqDCoMKgwqDCoMKgWEVfR1VDX0xPQURfU1RBVFVTX0dEVF9E
T05FwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID0gMHgx
MCwKPiDCoMKgwqDCoMKgwqDCoMKgWEVfR1VDX0xPQURfU1RBVFVTX0lEVF9ET05FwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID0gMHgyMCwKPiDCoMKgwqDC
oMKgwqDCoMKgWEVfR1VDX0xPQURfU1RBVFVTX0xBUElDX0RPTkXCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9IDB4MzAsCj4gQEAgLTc1LDYgKzc2LDggQEAgZW51
bSB4ZV9ndWNfbG9hZF9zdGF0dXMgewo+IMKgwqDCoMKgwqDCoMKgwqBYRV9HVUNfTE9BRF9TVEFU
VVNfSU5WQUxJRF9JTklUX0RBVEFfUkFOR0VfU1RBUlQsCj4gwqDCoMKgwqDCoMKgwqDCoFhFX0dV
Q19MT0FEX1NUQVRVU19NUFVfREFUQV9JTlZBTElEwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPSAweDczLAo+IMKgwqDCoMKgwqDCoMKgwqBYRV9HVUNfTE9BRF9TVEFUVVNfSU5JVF9N
TUlPX1NBVkVfUkVTVE9SRV9JTlZBTElEwqDCoCA9IDB4NzQsCj4gK8KgwqDCoMKgwqDCoMKgWEVf
R1VDX0xPQURfU1RBVFVTX0tMVl9XT1JLQVJPVU5EX0lOSVRfRVJST1LCoMKgwqDCoMKgwqDCoCA9
IDB4NzUsCj4gK8KgwqDCoMKgwqDCoMKgWEVfR1VDX0xPQURfU1RBVFVTX0lOVkFMSURfRlRSX0ZM
QUfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9IDB4NzYsCj4gwqDCoMKgwqDCoMKg
wqDCoFhFX0dVQ19MT0FEX1NUQVRVU19JTlZBTElEX0lOSVRfREFUQV9SQU5HRV9FTkQsCj4gwqAK
PiDCoMKgwqDCoMKgwqDCoMKgWEVfR1VDX0xPQURfU1RBVFVTX1JFQURZwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID0gMHhGMCwKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjLmMKPiBpbmRleCAxY2E3ZjRmMjdlMjYuLmM0OWZlYjhlYTBjMyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjLmMKPiBAQCAtOTkyLDExICs5OTIsMTQgQEAgc3RhdGljIGludCBndWNfbG9hZF9kb25l
KHUzMiBzdGF0dXMpCj4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgWEVfR1VDX0xPQURfU1RBVFVTX0dV
Q19QUkVQUk9EX0JVSUxEX01JU01BVENIOgo+IMKgwqDCoMKgwqDCoMKgwqBjYXNlIFhFX0dVQ19M
T0FEX1NUQVRVU19FUlJPUl9ERVZJRF9JTlZBTElEX0dVQ1RZUEU6Cj4gwqDCoMKgwqDCoMKgwqDC
oGNhc2UgWEVfR1VDX0xPQURfU1RBVFVTX0hXQ09ORklHX0VSUk9SOgo+ICvCoMKgwqDCoMKgwqDC
oGNhc2UgWEVfR1VDX0xPQURfU1RBVFVTX0JPT1RST01fVkVSU0lPTl9NSVNNQVRDSDoKPiDCoMKg
wqDCoMKgwqDCoMKgY2FzZSBYRV9HVUNfTE9BRF9TVEFUVVNfRFBDX0VSUk9SOgo+IMKgwqDCoMKg
wqDCoMKgwqBjYXNlIFhFX0dVQ19MT0FEX1NUQVRVU19FWENFUFRJT046Cj4gwqDCoMKgwqDCoMKg
wqDCoGNhc2UgWEVfR1VDX0xPQURfU1RBVFVTX0lOSVRfREFUQV9JTlZBTElEOgo+IMKgwqDCoMKg
wqDCoMKgwqBjYXNlIFhFX0dVQ19MT0FEX1NUQVRVU19NUFVfREFUQV9JTlZBTElEOgo+IMKgwqDC
oMKgwqDCoMKgwqBjYXNlIFhFX0dVQ19MT0FEX1NUQVRVU19JTklUX01NSU9fU0FWRV9SRVNUT1JF
X0lOVkFMSUQ6Cj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBYRV9HVUNfTE9BRF9TVEFUVVNfS0xWX1dP
UktBUk9VTkRfSU5JVF9FUlJPUjoKPiArwqDCoMKgwqDCoMKgwqBjYXNlIFhFX0dVQ19MT0FEX1NU
QVRVU19JTlZBTElEX0ZUUl9GTEFHOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIC0xOwo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiBAQCAtMTEzNywxNyArMTE0MCwy
OSBAQCBzdGF0aWMgdm9pZCBndWNfd2FpdF91Y29kZShzdHJ1Y3QgeGVfZ3VjCj4gKmd1YykKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgc3dpdGNoICh1a2VybmVsKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGNhc2UgWEVfR1VDX0xPQURfU1RBVFVTX0hXQ09ORklHX1NUQVJUOgo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3RfZXJyKGd0LCAi
c3RpbGwgZXh0cmFjdGluZyBod2NvbmZpZwo+IHRhYmxlLlxuIik7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiArCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBjYXNlIFhFX0dVQ19MT0FEX1NUQVRVU19FWENFUFRJT046Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZ3RfZXJy
KGd0LCAiZmlybXdhcmUgZXhjZXB0aW9uLiBFSVA6Cj4gJSN4XG4iLAo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV9t
bWlvX3JlYWQzMihtbWlvLAo+IFNPRlRfU0NSQVRDSCgxMykpKTsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiDCoAo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBjYXNlIFhFX0dVQ19MT0FEX1NUQVRVU19JTklUX0RBVEFfSU5W
QUxJRDoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhl
X2d0X2VycihndCwgImlsbGVnYWwgaW5pdC9BRFMgZGF0YVxuIik7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiArCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBjYXNlCj4gWEVfR1VDX0xPQURfU1RBVFVTX0lOSVRfTU1JT19T
QVZFX1JFU1RPUkVfSU5WQUxJRDoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB4ZV9ndF9lcnIoZ3QsICJpbGxlZ2FsIHJlZ2lzdGVyIGluCj4gc2F2ZS9y
ZXN0b3JlIHdvcmthcm91bmQgbGlzdFxuIik7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgY2FzZSBYRV9HVUNfTE9BRF9TVEFUVVNfSFdDT05GSUdfU1RBUlQ6Cj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9ndF9lcnIoZ3QsICJz
dGlsbCBleHRyYWN0aW5nIGh3Y29uZmlnCj4gdGFibGUuXG4iKTsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgY2FzZSBYRV9HVUNfTE9BRF9TVEFUVVNfS0xWX1dPUktBUk9VTkRfSU5J
VF9FUlJPUjoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHhlX2d0X2VycihndCwgImlsbGVnYWwgd29ya2Fyb3VuZCBLTFYKPiBkYXRhXG4iKTsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ICsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2FzZSBYRV9HVUNfTE9BRF9TVEFUVVNfSU5W
QUxJRF9GVFJfRkxBRzoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHhlX2d0X2VycihndCwgImlsbGVnYWwgZmVhdHVyZSBmbGFnCj4gc3BlY2lmaWVkXG4i
KTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVh
azsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAoK

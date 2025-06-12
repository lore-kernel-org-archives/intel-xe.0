Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B02C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 19:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F6D10E08A;
	Thu, 12 Jun 2025 19:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IF2s6ZF0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108BF10E08A
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Jun 2025 19:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749756627; x=1781292627;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=anU58gq2sZKPJAxWhQspe6AAShr6lmOMHhmZ/kOBd1E=;
 b=IF2s6ZF0y81ezpSP+YgF+rk4Bv/ixB1U5Nvl8e/oYq+yPtU2dgMBjmp4
 KCr69Jr5rOxI8Y9vviblAhviFQ32l5Q87KV9WbbLVSHB4thlV5SNrryns
 HCzQi30ahZ0kdFJAcd/YOBtS4J5b2iwpReG0PUU3mTbWvZorHVBO5thJN
 jvjqJSX264xogUdonjxOapMmK+COZWesOamWeGTrYu+EbVz3Hi7q730y7
 +xC6DwpEMJFhtcbrhewo4t1eosiZFXtxJ7FGHoKanEOVC/6IzEADb1XjC
 uTnw9uNUuxXeoVnpwWJhdJTphZg5phoNJdx62Fy718PMNSYsRnDD7lxrX A==;
X-CSE-ConnectionGUID: Yo/pHTIYTeeDV6g06Rd3GQ==
X-CSE-MsgGUID: P2m953epSBS0KgxNIOm4UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="77354913"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="77354913"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 12:30:27 -0700
X-CSE-ConnectionGUID: qyinvZpsRbaViH3qJfbq3Q==
X-CSE-MsgGUID: Ox3s6wSeQYS6nMcOVRRdpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152383343"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 12:30:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 12:30:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 12:30:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.83)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 12:30:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJ/WVIwh1eCFB3cPar9Z98XKz5a/cq6SMXB8pdSr/Aujoo9BaYAy0zMS3Jx6IgY6/z/hSNvOaGcKvQ5Ke9PYkH1zM3CB8AziSfY0cux0xJY4au6p3jFLb7nbLhb2hgjivYERUUaNVIdFd/UrZvSCzKhhbDeGqJ1MyOGe75PF99OY10c5+98aN2p3T6gbmNJ5eAZQ9nGqLLE3JxI192LsnnoKf9YfAE2CnMESdNrmLxigGvJlIXCLuyC2RlvY2go42zRk+jf+Hwt3PRNrRg9zBTYXi63MkM9wFxZ2TF5ggR5LISAFBX0u40t+0Rw+HNP8wE1jcR+K4qcI5tWdI0KUrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anU58gq2sZKPJAxWhQspe6AAShr6lmOMHhmZ/kOBd1E=;
 b=uHuDSyg6SSZJIk5mnrjg948WrdOCiT4yH5nNNkVn6URzwhqxNXGYneyWpdt2PN8JCxo9GzLMf/6XK1xFibHBQ4+1hj18oTP5/h3MH4gWZALeeSQRRlS/G4IC0oSxOJG3Y98gHC7L1997R/DL1vFgGdqF9gZLxprrIIQ92AXixt1Wsbyid1lpaxTBUlRvH1DgUjcQkHIVlnDXGoF9izowVHPQj+mriQgVfFhIj2nK/F1wwSCBwgDMYFruk9DEov+chyY7H4rFnVppLfRYRthnvCI/rYGyjHPWpLsPrBKJH6NFqi3EPM7KSsbliMw485OcBa6YXBPWnBJHYSe8+W5K1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA0PR11MB7815.namprd11.prod.outlook.com (2603:10b6:208:404::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 19:30:09 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8835.023; Thu, 12 Jun 2025
 19:30:08 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>,
 "Harrison, John C" <john.c.harrison@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Topic: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Index: AQHb2xSzLBYfnS7v50yLux3KtR2gnbP/6qWA
Date: Thu, 12 Jun 2025 19:30:08 +0000
Message-ID: <dc8437c7df641bfd774a40162d37122c1493e3f4.camel@intel.com>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
 <20250611210553.3756700-3-John.C.Harrison@Intel.com>
In-Reply-To: <20250611210553.3756700-3-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA0PR11MB7815:EE_
x-ms-office365-filtering-correlation-id: c0d1640d-1f0b-46f7-6b7b-08dda9e78aea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?c2Q1WEswY0dxc2dFeTRTVzJucnlZTVNvZU9jdzBZNTJmY0dhMTFnRWV5WVhv?=
 =?utf-8?B?ZXRpblVsREVRVmRmTmRzYVZyY21mTTFGbTFNSHRWS2lQcTRPcUNiZU9zZVlH?=
 =?utf-8?B?K0NMTzhWWDhZN00yU3IzOGdldjUrSEFESm03M0V0Z0kxaHRHZkc4dVIvVjEx?=
 =?utf-8?B?UnJNcXV0QUtnRmNLMW0yY2JlV3IyRnc4dEp1Qi95UWRDZW5xSHoxbExHS09a?=
 =?utf-8?B?MjExWnZ5VnA5NFUrNVV0dWVBcHBCb1ltT1NLb3pGK3Z6WGo1a3ZoaXNIUUFi?=
 =?utf-8?B?UFV0MmY4Y2NFbG5LR1lEL2c1M21pMjR5eVFGbjFCLzQvcGRtTC9WTUNnSXdG?=
 =?utf-8?B?S2Z5SWtjZXN6YVdPM0VvODB3dHh2eDRZNytkbzU3VGptczhkTklOTi9IRUdH?=
 =?utf-8?B?ZlZXcXUyek9aTzI4VzZkdXlKR3J1VlN6SFhRaGpTbE1wdTJrV3RTQTZyUVFK?=
 =?utf-8?B?M29yNnVBTWx3NE9OTDAzTlhkb01DSHdobi9sdnlZcklTdGVwQmZRRzU4NkxT?=
 =?utf-8?B?Tjk0MEcrUEtJWHdvZXl1YThXNW1IaXVOcld3N2JDU0FRY3k0cDRPbmttQWFl?=
 =?utf-8?B?czZsUWdObTZtdzZuZkhtQ2xnV1ZyV0NGQlg2WmcrS1Y0cmVseG1BUURaaGhp?=
 =?utf-8?B?L0plUzRkT21HUHRhcUFwUGFHR2hiQ3pVUHRVbDhwZml5TlRscTN1eC9nV053?=
 =?utf-8?B?dGhZV2RuRk5PNlZ1OGZieEEvTlJDTVZER3lkTWpxRFRFdzJ0eFJjUHVrcGg1?=
 =?utf-8?B?b1UyY1gyTVdBa3JteEtrQ1ZxVGdwelVFZS8wZEo5ODRManJsNTRrSzBYUXpj?=
 =?utf-8?B?YUJEd09KaUNoRjJ4MlI1SkcwSW1iTVZxWWFzaENDeCtDRFpFYzN5TXJCN2lW?=
 =?utf-8?B?eHhjaWpBZ0lMUHBpSUxLY083WVkrTUNDb2orNDkzZWI3VlhRQ3lvbEtCRVg4?=
 =?utf-8?B?TDNxL3htQW5vSHkwUzJnV0ZmWklVcTJnQlVmbXB6U2FMcUFGc1JBMjBSSkZ3?=
 =?utf-8?B?NjBibEpySXFINjBTQ1FNdjRSU2dDMXI4VEtQTDg1bGFwWmw1ZHRMTEdMQS9M?=
 =?utf-8?B?aUxoK2Evci8zQ3BTK0dvM1RKZmFjdDJ0VTh5emUzbno2NjRyZC9GWDljbDIw?=
 =?utf-8?B?RWVadTNjREtzTlc1ZmIxRDNzZk1mZTRQYnF3RUhaU2tjWi9zYnRTMHN2SmRi?=
 =?utf-8?B?OWpsanplSTRJZWdhdG5aZzE1MkxhQ0dGeUNFOCtTalRLUlFhYWR3ZmJZY1ZR?=
 =?utf-8?B?NGlodjJqV1hicjRSY2dyU3FoYjB0UUE5bkVjQ2REelBCb2JBM0c4V05aWm9E?=
 =?utf-8?B?aU9hZTJ1cUROQUxBOUVCOVA3N0lGUEpuY2Rta0VFVFNIemxqcmExQjdndWtB?=
 =?utf-8?B?NUc2azBBbmQ2TE0xeUhGKzJSbDlPZUVIV1hZWTJ5MURXQ0gzMU5mTmdBZUNH?=
 =?utf-8?B?azNtVGF1VUozUW5WZ3orQ1NNenZlV0xMcFlxNEQ4cEx3aExyN3ZTYnkrbFc5?=
 =?utf-8?B?eENYYmdFOXBVdlZzZkM0KzZFZVJxbGQwRDFZYzVUVnUvL0cyS05Cdit5RWw1?=
 =?utf-8?B?dFdPSFZYOTRvcEk5Z1FYN1NHNDE1OTNQeFRnMnBQSnlGd2huVkdwS3NpOFVk?=
 =?utf-8?B?c3NaZVhRazF1ZkVhbitkNzVVa25SYjRGVlJvMGh5NGVjY3liOTlRYWR3WTVl?=
 =?utf-8?B?eGQrOURlZzNXZlZuWmk4VFdIcDFWY0JBc2lnWmVXcWN1OXpRSnhLc2pta1N2?=
 =?utf-8?B?di9UQ0xDNzFMSUtDVU9KdlRORzAvMXA5Y25PbXhYSUV3UXJaUE5hQ0lDNUE2?=
 =?utf-8?B?Q1hyWjRkYjZPZXc5eDAwL0tLVVJZYW1rNFBhai8wNkNpdHNkUDhXcCt4ZlNa?=
 =?utf-8?B?MXU0bG5Gd0xoZjBsdkNZNFBQY1E3VDY4R3l2Rnh1MGZsUGo4SVpiQUtoMEg3?=
 =?utf-8?B?bzlwaTRSR3g1ZUFPdGJuR0F4dzFJUjdjRDlDRk5ianpNdmw3TXVkeE5kK2Rw?=
 =?utf-8?Q?0uIArajzZr/hasqA6rYQ9bQ/7vQL48=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHpCY002cU1rZ09SRjBMUGdibXkwUVA2TDJGZ1lEVWhjaVAwUk0rL00veDF6?=
 =?utf-8?B?SXpxUTJqT0Q2dndTN3EzdEM4MlhLQnlQaGI2WTFudTM3NTJqRXErWUYxOFMz?=
 =?utf-8?B?V2tXQVRmL1BZaVZZVWhZNlVQbHNVRk9Dcm9sV0hGRG5EQ1V3dW9uKzVLcTZj?=
 =?utf-8?B?RVJLK1FSSzh0THdYMzErR2xmaE5xL0FBdTZzRlNrdXduS2V5SmllTk05d3pv?=
 =?utf-8?B?WE1DVUxEcVFaSlBzYVhSUk1SL3lnVGdFS3gwRlQvZzBGVEhxZkVUNG14ZFdm?=
 =?utf-8?B?eEUyY0ZGMWx1TU5USUhuME84T2hsdERPWUIra2NJRHFnNGdOTzVVRE5VNTNk?=
 =?utf-8?B?a1N6OHB1Q2Q2SndiZnRyZmowNHU1am5RVWcvVlVEenJMaGRseDVkWEhrS1Vn?=
 =?utf-8?B?RWd0UTJOaGVBdHlGeXRzUFo4QU5NWHJzTFltMzV6YUlKa1ZQZUQySnByakU4?=
 =?utf-8?B?Q2dMWVdIOEpmODFieWVUZExqY3RZZ2xMbVB2UUF3cktkTElkQnJUQXJLWFRL?=
 =?utf-8?B?VzVqVytjWnNMcktiQTlpL1FIQzJlWkMrNnU4M3hVazVFVUlTNXdwTExKRWV5?=
 =?utf-8?B?d0hoZjI3UXhScm5pcTlOaHY3VGZaaFhWZEQyQ1F5ZHR4WmdHeGNKZEdHRDVE?=
 =?utf-8?B?ZlozT3dWUVVTUSs1aFhkc2pON0hPalNpU0plekorT242SFRSQzhsSGllcFY3?=
 =?utf-8?B?QmlGeWV3SEUyWm1MZm51TU5zVitnYVJjUmwvRVNXelJ3MHM0dGZSaDEwbzBv?=
 =?utf-8?B?STViR2hCQlJJZTNYVzcyR04rNURtT2RZdHdWaXEzZ2FObFZzaDF6QlZHNita?=
 =?utf-8?B?eDhES2dYNXpCdnZLcTAvYnZtMWhzS1IwNkd0SzdPYm1UN0RHYmlOeFdWZHdD?=
 =?utf-8?B?eXhBRHlZdU9BOG43blFGeHpPV1ExYUJyVE5DMmR0U24xdGt3TitBamtiSnha?=
 =?utf-8?B?MUFveUErTjZJWXdaK1ZaQ2o3RzJ4Q01XRUhiYklxQnpwT09sM214QXlsZjZm?=
 =?utf-8?B?VUJDeDlkbVlxalA1c0R0bk9XY0tyaVdsa3ZhQ0NRdGN1cGNYM2lkaEdFMkxF?=
 =?utf-8?B?L0MrREJZUkorRGJVVFFsMkhVT2pXaW1ieHFqYlZBV3RSekxrVVRyQkpiWCtB?=
 =?utf-8?B?NGZPczRQWDd2b1poRGtVNmgrcVJCYm9UVm9FeitQRU5xRVpnZ3pHVHZoMzBS?=
 =?utf-8?B?OXZuWm1pSS81YkxzNERyRS9xMktNQldzSGw5N2JranorR1VLTmVQakhTclY5?=
 =?utf-8?B?U3M0N29jNmVXdUQxZmU3aVlTMjZSS0ZHRXd4SDU2VGFDTVJqblR4MkRXU1pl?=
 =?utf-8?B?UEN3VU04cG9ISTVLeDVySDZWcFdjN1RTK2xvcm4zazFCTGpRLy9vRFgxd1Vq?=
 =?utf-8?B?aFBMbjR6VG9JSDBLNnROOXFOVTJmaDlOWGhvY1ZCT0NBaGNTcTBwY3NROW04?=
 =?utf-8?B?emFCeGhBWjJ1ZjVmbjFXdGZrR2Q0RVArTHV5cW1YTy8vcVAxaFJhcHkyTTlR?=
 =?utf-8?B?OWdESCtFeTV2VHFuOUR1cTBXMjdUT1R4S1ZzLzRydWJXWkliUlVIdmdGVEcx?=
 =?utf-8?B?cXNsMzYxOVUzdi91VDg5clVFTGJkVDVzYlF6VHphMmxiZVhJWjA5Wkc5ZWl5?=
 =?utf-8?B?UG1RUUlGazVEQXZtM3RHQWd0UTA5dDZrVElVVXRWVDllRzNGMHBUSExHS0dV?=
 =?utf-8?B?UW16emRvOTAwazh5MTArTlRGekxaeFVUdGluUVEza1htSVV3U0NrUmg3MmVV?=
 =?utf-8?B?T21CMlpsUVlHMnlZTlIrcWU4dWFRQ2Q5ZEc4QnpFOHg2ZDg2eTVLVGx3b1dt?=
 =?utf-8?B?T3ZlNTZqT1oveCtiU1F6TlJNdWhEYXM2SC81ZXFORzFraFVZNnBpVnBWUGE4?=
 =?utf-8?B?UStBRDZwV0FkdVZWQ3VXSXJVanFscnVxVnRHNlI3SklxbHNGam1QcnE4Wm9P?=
 =?utf-8?B?UTRHZnU1VDViWkxNaHc5MWNLYzJBTk4wTFk2blVFSHhFYlIyaEJTbWZUTjZ0?=
 =?utf-8?B?dGFrc1YwaTRTaytqbFlEMElFUGR5SktxYk4xUU1Rdi9FZ29ZVUpLMnR6RUNq?=
 =?utf-8?B?ZUdWWmk3dlhqOUR2ZGZRRUEyYTR3UDExQzhpTTZDZEFoMStvcWFjaWdXY09V?=
 =?utf-8?B?SDkzNkR2SmJLWkNrdHd1TFl2ZFhaTTVYaTRuelRuZkgrZHpCTUFtbW1IWTN6?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F828CEB1D48C7B4799557468366E9D1F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d1640d-1f0b-46f7-6b7b-08dda9e78aea
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 19:30:08.9206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wB25Yqy27C+qlnSFeAy9o+4aRU14FPXFG15x4nH5LH1WPCS3Q2s9JARAVI5zKKcjOxMQB2gPz0LhnVbg3uzGDFBEG03W7ZTq92PR2JqZX80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7815
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

T24gV2VkLCAyMDI1LTA2LTExIGF0IDE0OjA1IC0wNzAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPg0KPiANCj4gVGhlIEd1QyBoYXMgYW4gb3B0aW9uIHRvIHdyaXRlIGxvZyBkYXRhIHZpYSBO
UEsuIFRoaXMgaXMgYmFzaWNhbGx5IGENCj4gbWFnaWMgSU8gYWRkcmVzcyB0aGF0IEd1QyB3cml0
ZXMgYXJiaXRyYXJ5IGRhdGEgdG8gYW5kIHdoaWNoIGNhbiBiZQ0KPiBsb2dnZWQgYnkgYSBzdWl0
YWJsZSBoYXJkd2FyZSBsb2dnZXIuIFRoaXMgY2FuIGFsbG93IHJldHJpZXZhbCBvZiB0aGUNCj4g
R3VDIGxvZyBpbiBoYXJkd2FyZSBkZWJ1ZyBlbnZpcm9ubWVudHMgZXZlbiB3aGVuIHRoZSBzeXN0
ZW0gYXMgYQ0KPiB3aG9sZQ0KPiBkaWVzIGhvcnJpYmx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
Sm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jwqDCoMKgIHwgNCArKysrDQo+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX21vZHVsZS5jIHwgNCArKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21v
ZHVsZS5oIHwgMSArDQo+IMKgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjLmMNCj4gaW5kZXggZTE2ZDE5YjQ0YmNjLi45YzBlMzExM2Y3ZDUgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjLmMNCj4gQEAgLTM1LDYgKzM1LDcgQEANCj4gwqAjaW5jbHVkZSAi
eGVfZ3VjX3N1Ym1pdC5oIg0KPiDCoCNpbmNsdWRlICJ4ZV9tZW1pcnEuaCINCj4gwqAjaW5jbHVk
ZSAieGVfbW1pby5oIg0KPiArI2luY2x1ZGUgInhlX21vZHVsZS5oIg0KPiDCoCNpbmNsdWRlICJ4
ZV9wbGF0Zm9ybV90eXBlcy5oIg0KPiDCoCNpbmNsdWRlICJ4ZV9zcmlvdi5oIg0KPiDCoCNpbmNs
dWRlICJ4ZV91Yy5oIg0KPiBAQCAtNzQsNiArNzUsOSBAQCBzdGF0aWMgdTMyIGd1Y19jdGxfZGVi
dWdfZmxhZ3Moc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiDCoMKgwqDCoMKgwqDCoMKgZWxzZQ0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZsYWdzIHw9IEZJRUxEX1BSRVAoR1VDX0xP
R19WRVJCT1NJVFksDQo+IEdVQ19MT0dfTEVWRUxfVE9fVkVSQk9TSVRZKGxldmVsKSk7DQo+IMKg
DQo+ICvCoMKgwqDCoMKgwqDCoGlmICh4ZV9tb2RwYXJhbS5ndWNfbG9nX3RhcmdldCkNCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZsYWdzIHw9IEZJRUxEX1BSRVAoR1VDX0xPR19E
RVNUSU5BVElPTiwNCj4geGVfbW9kcGFyYW0uZ3VjX2xvZ190YXJnZXQpOw0KDQpXZSBkbyBoYXZl
IHRoZSBuZXcgY29uZmlnZnMgZW50cmllcy4gSXMgdGhlcmUgYSByZWFzb24gdG8ga2VlcCB0aGlz
IGluDQp0aGUgbW9kcGFyYW1zIGluc3RlYWQgb2YgbW92aW5nIHRvIGNvbmZpZ2ZzPw0KDQotU3R1
YXJ0DQoNCj4gKw0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGZsYWdzOw0KPiDCoH0NCj4gwqAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tb2R1bGUuYw0KPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9tb2R1bGUuYw0KPiBpbmRleCAxYzRkZmFmYmNkMGIuLmZjOGM2ODE4
MTliOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21vZHVsZS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tb2R1bGUuYw0KPiBAQCAtMjEsNiArMjEsNyBAQA0K
PiDCoHN0cnVjdCB4ZV9tb2RwYXJhbSB4ZV9tb2RwYXJhbSA9IHsNCj4gwqDCoMKgwqDCoMKgwqDC
oC5wcm9iZV9kaXNwbGF5ID0gdHJ1ZSwNCj4gwqDCoMKgwqDCoMKgwqDCoC5ndWNfbG9nX2xldmVs
ID0gMywNCj4gK8KgwqDCoMKgwqDCoMKgLmd1Y19sb2dfdGFyZ2V0ID0gMCwNCj4gwqDCoMKgwqDC
oMKgwqDCoC5mb3JjZV9wcm9iZSA9IENPTkZJR19EUk1fWEVfRk9SQ0VfUFJPQkUsDQo+IMKgI2lm
ZGVmIENPTkZJR19QQ0lfSU9WDQo+IMKgwqDCoMKgwqDCoMKgwqAubWF4X3ZmcyA9IElTX0VOQUJM
RUQoQ09ORklHX0RSTV9YRV9ERUJVRykgPyB+MCA6IDAsDQo+IEBAIC00NSw2ICs0Niw5IEBAIE1P
RFVMRV9QQVJNX0RFU0ModnJhbV9iYXJfc2l6ZSwgIlNldCB0aGUgdnJhbSBiYXINCj4gc2l6ZSAo
aW4gTWlCKSAtIDwwPWRpc2FibGUtcmVzDQo+IMKgbW9kdWxlX3BhcmFtX25hbWVkKGd1Y19sb2df
bGV2ZWwsIHhlX21vZHBhcmFtLmd1Y19sb2dfbGV2ZWwsIGludCwNCj4gMDYwMCk7DQo+IMKgTU9E
VUxFX1BBUk1fREVTQyhndWNfbG9nX2xldmVsLCAiR3VDIGZpcm13YXJlIGxvZ2dpbmcgbGV2ZWwN
Cj4gKDA9ZGlzYWJsZSwgMS4uNT1lbmFibGUgd2l0aCB2ZXJib3NpdHkgbWluLi5tYXgpIik7DQo+
IMKgDQo+ICttb2R1bGVfcGFyYW1fbmFtZWQoZ3VjX2xvZ190YXJnZXQsIHhlX21vZHBhcmFtLmd1
Y19sb2dfdGFyZ2V0LCBpbnQsDQo+IDA2MDApOw0KPiArTU9EVUxFX1BBUk1fREVTQyhndWNfbG9n
X3RhcmdldCwgIkd1QyBmaXJtd2FyZSBsb2dnaW5nIHRhcmdldA0KPiAoMD1tZW1vcnkgW2RlZmF1
bHRdLCAxID0gTlBLLCAyID0gbWVtb3J5ICsgTlBLKSIpOw0KPiArDQo+IMKgbW9kdWxlX3BhcmFt
X25hbWVkX3Vuc2FmZShndWNfZmlybXdhcmVfcGF0aCwNCj4geGVfbW9kcGFyYW0uZ3VjX2Zpcm13
YXJlX3BhdGgsIGNoYXJwLCAwNDAwKTsNCj4gwqBNT0RVTEVfUEFSTV9ERVNDKGd1Y19maXJtd2Fy
ZV9wYXRoLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiR3VDIGZpcm13YXJl
IHBhdGggdG8gdXNlIGluc3RlYWQgb2YgdGhlIGRlZmF1bHQNCj4gb25lIik7DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfbW9kdWxlLmgNCj4gaW5kZXggNWEzYmZlYThiN2I0Li40ZDk3OGY2ZjI2YjYgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tb2R1bGUuaA0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfbW9kdWxlLmgNCj4gQEAgLTE0LDYgKzE0LDcgQEAgc3RydWN0IHhlX21v
ZHBhcmFtIHsNCj4gwqDCoMKgwqDCoMKgwqDCoGJvb2wgcHJvYmVfZGlzcGxheTsNCj4gwqDCoMKg
wqDCoMKgwqDCoHUzMiBmb3JjZV92cmFtX2Jhcl9zaXplOw0KPiDCoMKgwqDCoMKgwqDCoMKgaW50
IGd1Y19sb2dfbGV2ZWw7DQo+ICvCoMKgwqDCoMKgwqDCoGludCBndWNfbG9nX3RhcmdldDsNCj4g
wqDCoMKgwqDCoMKgwqDCoGNoYXIgKmd1Y19maXJtd2FyZV9wYXRoOw0KPiDCoMKgwqDCoMKgwqDC
oMKgY2hhciAqaHVjX2Zpcm13YXJlX3BhdGg7DQo+IMKgwqDCoMKgwqDCoMKgwqBjaGFyICpnc2Nf
ZmlybXdhcmVfcGF0aDsNCg0K

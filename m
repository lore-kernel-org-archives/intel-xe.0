Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8427BC3ABDD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 13:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479F710E49B;
	Tue, 20 May 2025 13:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZkjABA/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B712810E49B
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747748924; x=1779284924;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5lPgi6MUYfNnixWSXqNkL7wyGCy9ZBiVJi/GKba/GPw=;
 b=RZkjABA/WnZVEms5Add7eii5z0usG/xrd9UWRPstZyOK675KIQzgOQbY
 tliV8xTJNRcl1H17unOhSrpjbybvCbCHmjRHJTP0x5haROImokVthmdSk
 2NdDPJCptN/U5JAlHGQpyHZhu8a2ODVvqVmiGGKx+TIjZ42YAFc26K81h
 6Ig4KKoa5BvcyEKfQx/39Piw1kyACQ+EG5Js1fY7Lf8hqG3GnZ2yC8zL/
 rg5V3Im357QQ2LLgn5u7H1UXpVkOa43zwRwvixvwvV4kWeOukRpzNGCvw
 4y+CH8WTmv0EaCI23Ta+IgcJiDiIK63HVTb0Xj94sLdAUbBt9fnlQZIhm A==;
X-CSE-ConnectionGUID: mqXr6EQXR2aW4Awkh0sLSg==
X-CSE-MsgGUID: 54QveBEMTmapUTxNlIaYKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="67093143"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="67093143"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 06:48:44 -0700
X-CSE-ConnectionGUID: uIyvJuxVRxyVrsajdpjg9A==
X-CSE-MsgGUID: tWgJVTcOTQ2TIkRgsCEdTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144955192"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 06:48:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 06:48:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 06:48:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 06:48:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQX09vlrYXPmdyia4RG5yQaIbaGKZI/jvkus1FZuCDu5VAN3v57TImkFNA67NdNzVOc9vFy1knfpDyxc/NdgQ6Sqh45od2ozf+fEVxTwIu1U/TNGbUfr4grjCTmrw5+CpTlWZbyEOdOR2Vu1JQ5rDJYFzeRQ1WbjMySoKMbSgP6VVa1rVUhHBuWwDC+XGKMEgP0ztAZjUwvDGS8ethgQ5HrJRuz5oqWsHd0wJyu0yJDtfmfo/chaA4DaZPXDhp/RmIf4ZQAOGs2y31xo1s3YzeP8FScvJc9MiLQ1Bz7xH8LiTPKUBNlcMEPvAJrbhwbN56shMdFZ4gvLXyY7ZWCXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lPgi6MUYfNnixWSXqNkL7wyGCy9ZBiVJi/GKba/GPw=;
 b=cvYzsJbZDqReABfbf+/YFikSrKajPSPAsJnJjIlAgZcNJrkVavNlTCol4q8ahG1sCFjuajQmxaqaqmIuvT3XMw0RfSzoHpgR5a/FqAjpqq2vHMhylpKFNbP62K+JG4Z3kOiD6GO12cDsCVILT573af/oKFXkM3680ZtEo/XwM+gzXmw5W5APuuxsIMtE3eGloUUGoxKTk3/xhSI8SDhxSN/c6KPemtpI177Ti/e/9DKR6CxL9d/FJHGbgnEyJwMdCrFCScRKJ2XzDygeYLbU9CbXDtpAi5NDx4V78fcHToQart0hoIgHeYG0NSfYYUPnp8A9BkdCOm6yJBpVwL4oWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ2PR11MB8324.namprd11.prod.outlook.com (2603:10b6:a03:538::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 13:48:39 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 13:48:38 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
CC: "Harrison, John C" <john.c.harrison@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/pxp: Clarify PXP queue creation behavior if
 PXP is not ready
Thread-Topic: [PATCH 2/3] drm/xe/pxp: Clarify PXP queue creation behavior if
 PXP is not ready
Thread-Index: AQHbyRZg5p+jk/tx1UGLSrUFgXgHaLPbiZIA
Date: Tue, 20 May 2025 13:48:38 +0000
Message-ID: <e4df587480a90f35e6c5ed39e55c4e7498b534b1.camel@intel.com>
References: <20250519233228.3754667-5-daniele.ceraolospurio@intel.com>
 <20250519233228.3754667-7-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250519233228.3754667-7-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ2PR11MB8324:EE_
x-ms-office365-filtering-correlation-id: 0a5fc175-9411-4871-aea6-08dd97a50601
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M0VwNUtuUTVZS1NwdkltYnBZVmdlWm13cHZwVjg5VjFuV1JZTTZNUlNvVWsv?=
 =?utf-8?B?azI5VHZDbFFuTktlSmJ4SktuYVl2NmxwRG1YZkFJYUN5WkZSNjZHUVExKzR3?=
 =?utf-8?B?Q3c4K1Nxa0trcDJJNkRqRXY5alJ4M1ZmYm8zNmtEQ1RTT0lESTV3R0dCbE9r?=
 =?utf-8?B?eHhUQWFNaThaYXhWcGNCVFdpNEFuaENUSmQ2UjBQZkpDOFBvb3hjdzkvcEla?=
 =?utf-8?B?V3IrS3c0NmZDT002WHRXN1ByWFV1Y1dUZG1zM0hrNUh5L3l4eXYyUGRueHFj?=
 =?utf-8?B?emI0QUw0SUdPcnRSaGZvRTZJYXI3Ym1aREtEZ3lmWjgyWXVHZ3JJb2xlaG1C?=
 =?utf-8?B?NmdIZzlzd0dmZnJwTHcwN2ZPdUY2WVVqSGw4YnYzVjhuN0lvbGE1VVNxTjQ1?=
 =?utf-8?B?WFdoNjJ3MXIxMzlOVkM2ek5paUhSRFh1S3ptOTZEM0lxbG1Wck5MbVBOdGJh?=
 =?utf-8?B?cE1iSC9mY0VEb2JCRmR6OGZWT0FCVVQxMUZnVVR4STdDQWhUa3NIVE9GckNC?=
 =?utf-8?B?WDd5cTNZcXJ5RTdkazduWWxzTktXMko3Z3YwS1l5KzNodVJUaCtHWGJoMVVl?=
 =?utf-8?B?R0xJQWN5aEdlOFNLWkxxV0F2ZFE0dE1WVkw2ZFhLL3lQdWRDQUFDZXhQZTdL?=
 =?utf-8?B?TWZLRkVDTTd1VWdTTUx0dzlXd3AxL2paRnBnU0s2ei93dnA1OTFScXVqSUt4?=
 =?utf-8?B?VXZyYzBteEd1Q2VnM0JXcEI4aE5zaGFvTGFtN3lCa2ZUVFBHU2lSelJwdjFK?=
 =?utf-8?B?QnFld0NFNXBXa0lIUjRrMFJDUWZvSEY3eXJrSGtzMmlZdkQ5czY2ZzBRRG5i?=
 =?utf-8?B?UmZRQUFwckRDK2M4bzFZTmNjR3hESDgxUVZWYjJuM3cwUWFJRFVUZXlzR0ZD?=
 =?utf-8?B?VmI3dlNQQjhzM2FpbGFONzBFNVJNT1Z4bXlaUjZ1NWI2WjQrdmdLODJ1SDd0?=
 =?utf-8?B?YUFwZ0tPb1kwL1NFZTgzLzdzV2l3bFc2YlMya0hobld3a2FEWEFvMEFsclow?=
 =?utf-8?B?UmMwVjRxYXAzL2xKb2h3bi9LeGw1VFhLbXdtdDhUeDN0TTBaMXZURlovcXI4?=
 =?utf-8?B?SnZ3a0pGa2RzQTFQRGtDSTU4L0gzYXBDQ3YzK016d2pMeXJzVnRROS94MkRN?=
 =?utf-8?B?YjIvNWhoblUxTVJoSVZBUStZR2gzc1IrV2w0QlArcldUWlJvU3pMaHQ1UFBF?=
 =?utf-8?B?MGE1cnBBdHIwQms1ZE1zN0R4dmkxbVM2RVdzRjBFcjErVTE0blVWamJXSTdH?=
 =?utf-8?B?Nk9EZmFCN0ZOR1NzdlBoQ0FwZmpTK21jUFFNQzVOeU8vU3hoV3k0YTFCUHYy?=
 =?utf-8?B?OTVaVjVJckNTcUJRVWsyZlEwWnhQa29WZW9rUzloR0R3OVBrL3BadXZJTDZl?=
 =?utf-8?B?clVhMFBLTTdGcWwyVlBNZFdWbXFLRFM4VFQ3bjlXaFR3dW95dStqbTNhWFB4?=
 =?utf-8?B?M29zajYreC9TQ1E3enBQR0p0bEIxS0pLVFZtSm4ydi9DVVQvTE9ac2JDMnlJ?=
 =?utf-8?B?RXFmK2ZQNG9mWnVzdi9VMUUyc05QajlyazR0L2daQkxCZUpvTkNCWERVQmtn?=
 =?utf-8?B?N21qR0Q0ditsNmFqNUdtdFhDMm41bjYxMThoNzNFZWVXM2hMbVBHdzJ1enlG?=
 =?utf-8?B?dDNwWE9jaENZdjUrOUtINjV4b0VnUEY4MjRPYjkzWVl0V1UySC9KN040WnFH?=
 =?utf-8?B?dTNDbHFQVURMQ3oyZHUxMWpFWm5RTE9HdXhUTTZXNlZ1b0FvZE12Q1UvTUJL?=
 =?utf-8?B?Ym1PeWo5SHM5ZS9mVklDMkVlMldEL2dodW1qa1F1Vmg3OWdxMDdLQVhhUXRx?=
 =?utf-8?B?V0h1OERXQW5xZUpNSzhoQXhJS3d3cTJYaVlHa1RNcWh5Vlg0TFo4ZStjQ014?=
 =?utf-8?B?eFUxak04NzFGVnNkdGtyQU9BSmRNeGQ1RlRNa2FFUGxtL015aVFqNEMyOFV0?=
 =?utf-8?B?cUU4bGNLL21zbGhhMFllRXozL1dIL3VFbEFjNy9KdlkwMnlncXgrMEE4QXRM?=
 =?utf-8?Q?D7/ok+hzZ0pHy1cZm/ZaD5UdIHqhOY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzJOeVJ0MGVXUWVlOG1BdCtUTi9CdjBDSDAwbmR6eTFBRHdtRWgxdEM1UHh1?=
 =?utf-8?B?V0cwWVYydlRmNEhzOTB4elordzJmQ1RxNEJ4bm5aTTNCRlUxRU0raWMzMWVX?=
 =?utf-8?B?bVl6VHJaTzBjWm04QUVlb2UzeS8wVWowb2N1LzlIZFl4RDBKekthcmNWMlN1?=
 =?utf-8?B?OW82Vnc1Ylpod3NLWXFERnNKRmpKTUNUTmUxK2FpNk9zcnJHVlBqR2Z4QTh2?=
 =?utf-8?B?OEIvdWFDZG1xUkhWQ0FuQ3ZGOThlZnJWMDEwT2tWb2syS2tGWVJuTmdFQ2tk?=
 =?utf-8?B?VnRWa0FGWDhscUxFRGEydklsK2dnTFgxeU5hWjM0b0FRandhRW1ONXdoTUxT?=
 =?utf-8?B?UWI4SmxIQ3hWUUdBS3RNcXpxK3d0dE9aT29yNjlVMWIxVnJHVG85N0duaVRt?=
 =?utf-8?B?NFJqbUFpbC8ycllJSkhRK3RJa1RPNmJGWkJ6VGs4bEgwbEtQNmllVnp0STJS?=
 =?utf-8?B?NEtZTGF4UHg2SW04cXNwcXBqYmJtYnBYYUV5dU91blhPc1ZGWERheXRVeFpY?=
 =?utf-8?B?L1U3eGVOb1J6UVI0UWFKd0t0SHJkMEZ5eWJ0UzZROEtlQlI1ZDRQditYbzNW?=
 =?utf-8?B?ZWFlZi9UaGdtMVlQZ0FaRjRzZ2g1V3I5R1ZvU3lOVzJBbVJ0OEROK2djTDM2?=
 =?utf-8?B?Nk5aYXFraFI0bGxpQnFoQjViQ1VnWnlQcFMrTEl3WG45SHBrWHp1TFdhenJS?=
 =?utf-8?B?NWlMbWtRSG9PUlc4blV0aEd2Z3FJOEphZHpIUk1pOEdPT3RaNEpraWdJYm83?=
 =?utf-8?B?dUFBTTQvaVJqWnV6NUVTV2cxK2VsbkRnM3FYdWJtVjVEaC9XZ3VjWTNieDhm?=
 =?utf-8?B?dzI2M2hUdUtaeS9vWkZScG9uQUNZVzZ2M2FjK0VjekdNRGM4RlQ5bk9BMVkr?=
 =?utf-8?B?dXBEKzNGeld0VThnQkFRUDMzQ3l6MTZvbkNYNFlzVkZDSHBnbzZiWEpxZ25h?=
 =?utf-8?B?V3E2SVRkc2dFTnczQnFUVHdIcVQvaXh6S0RaUFZFaVhmSFAyck84NFVKZXUx?=
 =?utf-8?B?aEFiRmphclAzVUcwTUJJanlRTDY1S0NjTk5EdDlQazVpQzVOOHpjcm5sc0VG?=
 =?utf-8?B?cS9DaUl5Vnh3Um1iMEJaMk9FNFptMnJhM1kwMW0yRi9XRDI5SnJ2RG9ZTVFJ?=
 =?utf-8?B?bGpBOW9Oc3dkazhUOUdvQ1MvNlZPRytmczhZK1BpK3U4Nm5GVnlHUm9KZm5z?=
 =?utf-8?B?TGZJWmEvQXhSZis1WlA4cE0yNEJDYUhrRVUrUkJOWjFTNjdtSkNWenZWM1gv?=
 =?utf-8?B?OEgzV0pDVVZBYTBEL0ZJWCtleGZtYk1raEdOWDZZWkc4NHVUWlNXRC9udUxa?=
 =?utf-8?B?aXBoTjJBWXV1TnVhbFRyTzVXZlgvbmtsUWU0b25jdlQ5MUVtSkxiRWx4MGpY?=
 =?utf-8?B?THpPYzFpQXoxakdoa2IxUmxFYTJZbjUzS0svRW0wTWR6SlprQjRsWlNrSlY2?=
 =?utf-8?B?MVJzam5tbEVPTFlrcGJ5c0JEcUNDQVVzcm5xK1BzMkEzZndSdW1taC9OY2hv?=
 =?utf-8?B?a1FBSDJFVGxZTUZwTGtzZjZzQll3R2xmb0tFN1NwK1ZIV2ovRHVlYXhVeFIr?=
 =?utf-8?B?RG5LenlnTXZKZWJRVm1lRkRtVUpEcE5EZE9KNjlLRExVU0YyNUtkWEVMNGdQ?=
 =?utf-8?B?MmxSL1l4VkRFeVkrSStiN2xja2xPcWNEOXIzbms5NDBkQmZDdTFCRWlPcFgv?=
 =?utf-8?B?UUM0MDBFem9Kb3d3TGpkQ2NHdGtkOEt1L2FRbWRHQVA0YWlTVUNLSTJnV0lt?=
 =?utf-8?B?WXhLTExseXRlelFOdFhVMTduaU9BL0dFOVFsOC9QWHZ5ZWEvdGhDSldpV3Uz?=
 =?utf-8?B?Q1RRSVU1NnlSV0VTem5KWXB3ekhMTWFJajMzT2NIUHVvVFlwQnJHNXljM1Nz?=
 =?utf-8?B?Y3ZkVFNzaW52cEpadVRYdkNKbjhZQi9JOEFFZk0wc2FhczYwUEdqd1hqVHVX?=
 =?utf-8?B?VDRRMFV4Zktra0RFQXJOWkNzY3RxejNOdW1xTkM1aUdoNlJjRVZZSmF2L3FT?=
 =?utf-8?B?Tk1OTjJIZnpTSnJuc1kxUElsdHlXam1FaU9XNi9nYjRTVWM0MTJwRlFSeHc0?=
 =?utf-8?B?dW00SEZyankvWncvM3UxL1Y0bmhDKzlyeDhDVW5PQlFtdmVQajM4QXZDc0lI?=
 =?utf-8?B?dmxoVk02MlRwSG5ScEcvdzk4Q3k5TkthQlFGRXlXTVYwUE1OUGRjTmZVcFk1?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3015CBFA7C8D3C4A88026DD95221710A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5fc175-9411-4871-aea6-08dd97a50601
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 13:48:38.2182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OaIELbSq8AN60/Xd829r2AFaaMoKdE8MvS6DYdWAPTwOKZL2DSqYoSf+PJ9iDaioSptvnIcWEZ5Bq0bktt5YuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8324
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

T24gTW9uLCAyMDI1LTA1LTE5IGF0IDE2OjMyIC0wNzAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IHdyb3RlOg0KPiBUaGUgZXhwZWN0ZWQgZmxvdyBvZiBvcGVyYXRpb25zIHdoZW4gdXNpbmcgUFhQ
IGlzIHRvIHF1ZXJ5IHRoZSBQWFANCj4gc3RhdHVzIGFuZCB3YWl0IGZvciBpdCB0byB0cmFuc2l0
aW9uIHRvICJyZWFkeSIgYmVmb3JlIGF0dGVtcHRpbmcgdG8NCj4gY3JlYXRlIGFuIGV4ZWNfcXVl
dWUuIFRoaXMgZmxvdyBpcyBmb2xsb3dlZCBieSB0aGUgTWVzYSBkcml2ZXIsIGJ1dA0KPiB0aGVy
ZSBpcyBubyBndWFyYW50ZWUgdGhhdCBhbiBpbmNvcnJlY3RseSBjb2RlZCAob3IgbWFsaWNpb3Vz
KSBhcHANCj4gd2lsbCBub3QgYXR0ZW1wdCB0byBjcmVhdGUgdGhlIHF1ZXVlIGZpcnN0IHdpdGhv
dXQgcXVlcnlpbmcgdGhlIHN0YXR1cy4NCj4gVGhlcmVmb3JlLCB3ZSBuZWVkIHRvIGNsYXJpZnkg
d2hhdCB0aGUgZXhwZWN0ZWQgYmVoYXZpb3Igb2YgdGhlIHF1ZXVlDQo+IGNyZWF0aW9uIGlvY3Rs
IGlzIGluIHRoaXMgc2NlbmFyaW8uDQo+IA0KPiBDdXJyZW50bHksIHRoZSBpb2N0bCBhbHdheXMg
ZmFpbHMgd2l0aCBhbiAtRUJVU1kgY29kZSBubyBtYXR0ZXIgdGhlDQo+IGVycm9yLCBidXQgZm9y
IGNvbnNpc3RlbmN5IGl0IGlzIGJldHRlciB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuICJmYWlsZWQN
Cj4gdG8gaW5pdCIgKC1FSU8pIGFuZCAibm90IHJlYWR5IiAoLUVCVVNZKSwgdGhlIHNhbWUgd2F5
IHRoZSBxdWVyeSBpb2N0bA0KPiBkb2VzLiBOb3RlIHRoYXQsIHdoaWxlIHRoaXMgaXMgYSBjaGFu
Z2UgaW4gdGhlIHJldHVybiBjb2RlIG9mIGFuIGlvY3RsLA0KPiB0aGUgYmVoYXZpb3Igb2YgdGhl
IGlvY3RsIGluIHRoaXMgcGFydGljdWxhciBjb3JuZXIgY2FzZSB3YXMgbm90IGNsZWFybHkNCj4g
c3BlYydkLCBzbyBubyBvbmUgc2hvdWxkIGhhdmUgYmVlbiByZWx5aW5nIG9uIGl0IChhbmQgd2Ug
a25vdyB0aGF0IE1lc2EsDQo+IHdoaWNoIGlzIHRoZSBvbmx5IGtub3duIHVzZXJzcGFjZSBmb3Ig
dGhpcywgZGlkbid0KS4NCj4gDQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiBGaXhlczogNzJkNDc5NjAxZDY3ICgiZHJtL3hl
L3B4cC91YXBpOiBBZGQgdXNlcnNwYWNlIGFuZCBMUkMgc3VwcG9ydCBmb3IgUFhQLXVzaW5nIHF1
ZXVlcyIpDQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUu
Y2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IENjOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFy
cmlzb25ASW50ZWwuY29tPg0KPiBDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6
YUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B4cC5jIHwgOCAr
KysrKystLQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgIHwgNSArKysrKw0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9weHAuYyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9weHAuYw0KPiBpbmRleCA0NTRlYTdkYzA4YWMuLmI1YmMxNWY0MzZmYSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B4cC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9weHAuYw0KPiBAQCAtNTQxLDEwICs1NDEsMTQgQEAgaW50IHhlX3B4cF9leGVjX3F1
ZXVlX2FkZChzdHJ1Y3QgeGVfcHhwICpweHAsIHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKQ0KPiAg
CSAqLw0KPiAgCXhlX3BtX3J1bnRpbWVfZ2V0KHB4cC0+eGUpOw0KPiAgDQo+IC0JaWYgKCFweHBf
cHJlcmVxdWlzaXRlc19kb25lKHB4cCkpIHsNCj4gLQkJcmV0ID0gLUVCVVNZOw0KPiArCS8qIGdl
dF9yZWFkaW5lc3Nfc3RhdHVzKCkgcmV0dXJucyAwIGZvciBpbi1wcm9ncmVzcyBhbmQgMSBmb3Ig
ZG9uZSAqLw0KPiArCXJldCA9IHhlX3B4cF9nZXRfcmVhZGluZXNzX3N0YXR1cyhweHApOw0KPiAr
CWlmIChyZXQgPD0gMCkgew0KPiArCQlpZiAoIXJldCkNCj4gKwkJCXJldCA9IC1FQlVTWTsNCj4g
IAkJZ290byBvdXQ7DQo+ICAJfQ0KPiArCXJldCA9IDA7DQo+ICANCj4gIHdhaXRfZm9yX2lkbGU6
DQo+ICAJLyoNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNs
dWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IGluZGV4IDljMDg3MzhjM2I5MS4uMjcwOGViNzNjNTkw
IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1
ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTEyMTAsNiArMTIxMCwxMSBAQCBzdHJ1Y3QgZHJt
X3hlX3ZtX2JpbmQgew0KPiAgICogICAgdGhlcmUgaXMgbm8gbmVlZCB0byBleHBsaWNpdGx5IHNl
dCB0aGF0LiBXaGVuIGEgcXVldWUgb2YgdHlwZQ0KPiAgICogICAgJURSTV9YRV9QWFBfVFlQRV9I
V0RSTSBpcyBjcmVhdGVkLCB0aGUgUFhQIGRlZmF1bHQgSFdEUk0gc2Vzc2lvbg0KPiAgICogICAg
KCVYRV9QWFBfSFdEUk1fREVGQVVMVF9TRVNTSU9OKSB3aWxsIGJlIHN0YXJ0ZWQsIGlmIGlzbid0
IGFscmVhZHkgcnVubmluZy4NCj4gKyAqICAgIFRoZSB1c2VyIGlzIGV4cGVjdGVkIHRvIHF1ZXJ5
IHRoZSBQWFAgc3RhdHVzIHZpYSB0aGUgcXVlcnkgaW9jdGwgKHNlZQ0KPiArICogICAgJURSTV9Y
RV9ERVZJQ0VfUVVFUllfUFhQX1NUQVRVUykgYW5kIHRvIHdhaXQgZm9yIFBYUCB0byBiZSByZWFk
eSBiZWZvcmUNCj4gKyAqICAgIGF0dGVtcHRpbmcgdG8gY3JlYXRlIGEgcXVldWUgd2l0aCB0aGlz
IHByb3BlcnR5LiBJZiBhIHF1ZXVlIGlzIGNyZWF0ZWQNCj4gKyAqICAgIGJlZm9yZSBQWFAgaXMg
cmVhZHksIHRoZSBpb2N0bCB3aWxsIHJldHVybiAtRUJVU1kgaWYgaW5pdCBpcyBzdGlsbCBpbg0K
PiArICogICAgcHJvZ3Jlc3Mgb3IgLUVJTyBpZiBpbml0IGZhaWxlZC4NCj4gICAqICAgIEdpdmVu
IHRoYXQgZ29pbmcgaW50byBhIHBvd2VyLXNhdmluZyBzdGF0ZSBraWxscyBQWFAgSFdEUk0gc2Vz
c2lvbnMsDQo+ICAgKiAgICBydW50aW1lIFBNIHdpbGwgYmUgYmxvY2tlZCB3aGlsZSBxdWV1ZXMg
b2YgdGhpcyB0eXBlIGFyZSBhbGl2ZS4NCj4gICAqICAgIEFsbCBQWFAgcXVldWVzIHdpbGwgYmUg
a2lsbGVkIGlmIGEgUFhQIGludmFsaWRhdGlvbiBldmVudCBvY2N1cnMuDQo=

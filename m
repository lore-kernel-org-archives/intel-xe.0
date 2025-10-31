Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A251CCCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 16:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FC310EBE8;
	Fri, 31 Oct 2025 16:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Id5uuLJn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164C210EBE8
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 16:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761927024; x=1793463024;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dh1GJoRfnIH+cIsBsHvM1RkQNNP/UECvUFR7JB6EoXk=;
 b=Id5uuLJnpQWaaQpCd4CR4COJ/nL2yrBb0Vy0TmRwpaz+MU3q80WR5aNs
 z6Ln37zaJXLEhGJAy0Q23rzFAHaqKGgtBIy3Fnp0MLOBDa4pF7AcexSlx
 4unbsABnrcfvVRRFen+YYZIyuySgL9OyhBqZbrJjCvNjCxD4vISorz8qo
 M0LMfE4VxUP5M1VOhagCg5yRatJXkiMUHMw6pH2c/tdtIcJe3W6iCvetV
 zZoBWbrzgc9rt4/UQYFiuE0pmOK7ewtIxJ/VQ+sQd2YV2loCYjjuWceAY
 jm1t4RO5kUALkD1r6efC8B0gqTvjJXnw2sVEPKjaqyUNsJBk6yaJveA+H A==;
X-CSE-ConnectionGUID: hIDCAIjlSxGTk8lBwzAV/w==
X-CSE-MsgGUID: ZAULF9/hQNGfs3KxS6e35w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67929108"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67929108"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:10:23 -0700
X-CSE-ConnectionGUID: IT4n7MVOSh6alixSoJQaYw==
X-CSE-MsgGUID: tB3D5AlSRXe2+n5EW1C8sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186206977"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:10:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:10:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 09:10:23 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:10:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkB69GryffRAI5FywVt6dzgBxbDT7ppa6Tjuoa6le+nMq0cGsGh7zikEvCH0KOHW9K9teBhmAq9iMEKki7EmR6Z3XIKgRNrIvG2iXSwsUDRUhTOxuBJK3exlfQ7gm9uSLqgQw48WYyp+uXmUXdoAvoLF3UEoOzIFXL6dRo8Oy+1hGA5vua1hrv8WT+H8UWv/iL/MzRr9HoK7ZoeQEktg7jl4fKOAqL+NcHR6I5GoYDwzQXM0zXjqktX5wVZMJdikpurADMME+aWB7YmQbizv2Jd/ZjcPeMh+U7JBJJp/MOhQTLNcmYVaxi7/X4UNwNoTwkcZt8tXvxEfO9mJekCoxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dh1GJoRfnIH+cIsBsHvM1RkQNNP/UECvUFR7JB6EoXk=;
 b=yIbK2Ll5fAbrMFqWgkvLqZuAH9cpiRI5f516IldKqSiCWiTa8ZkWOc+DYtNiLghQ5NZTp9buuM+TYtdcX8DhbOn2aflFp7kMQ2TwiuIdlMPrxnwPuLO5lzILDZ6ASZtwz4W60ZT3VJbTAwTTBZ6do7B9XhpakbExEv/B0Ho7RFILqRqcZvEL7dc4PVdXGZVvjANN6LigAdb4ZL8HviIE8k19xQOd3eJHVXlAWwT9xHfbNG8Joj8JtwKUiQOpuV2rYl3KrFJYjr8yvKrgPIi883MnUPZXiUj4Lex9C0QwYfb2ODZdTT8lcWaDhfaAbXDOu2O3seAvHVlHIq+jg1dUsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH3PPF9E162731D.namprd11.prod.outlook.com (2603:10b6:518:1::d3c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 16:10:19 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 16:10:17 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Synchronize Dead CT worker with unbind
Thread-Topic: [PATCH v2 2/2] drm/xe/guc: Synchronize Dead CT worker with unbind
Thread-Index: AQHcSa98EHbQlP87lkyFSEx+3Tvy9bTa9KYAgAFkQYCAABVqAA==
Date: Fri, 31 Oct 2025 16:10:17 +0000
Message-ID: <d645934f37c3bf84a4f2b98d33285a3c172e73d5.camel@intel.com>
References: <20251030151122.3021436-4-balasubramani.vivekanandan@intel.com>
 <20251030151122.3021436-6-balasubramani.vivekanandan@intel.com>
 <4996795cdb5a48ab19247de78334df2b080c8758.camel@intel.com>
 <aQTNcStpNqix46Iu@bvivekan-mobl1>
In-Reply-To: <aQTNcStpNqix46Iu@bvivekan-mobl1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH3PPF9E162731D:EE_
x-ms-office365-filtering-correlation-id: eb0b8bf8-32b7-43bb-2b52-08de1897fbd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UmVMR29VZktXVzNMWFBpaWJORHEwckdMODlmUmlWM0Z4OHdWeE1uQjBDbWpl?=
 =?utf-8?B?RUlSNkdiTGlnZEJKS0hHdjV6R3ZJUmQ5UHkvWGlZSGdKRVNxYWllQitWZFFn?=
 =?utf-8?B?NDdwb09yTkxnK2grYzl2UlhVRVNTZVJieklkQnZrSHNUWitEazVGMGRkRzNo?=
 =?utf-8?B?MWxxeVdnZkFFRFpZTy9LT1g3eGJDcUVqWURtNzFNeWwzZE5lT1NjQVIyV3g3?=
 =?utf-8?B?YnVISGpMZWtyMmRkMUxDTjU1TFJuNWhCZTE4YkpmVUxnMU55L0ZpOWJBcXZs?=
 =?utf-8?B?QlQwWWsxL09peXc3b2tsbjNycnZDQ0xsSk80eXU2andXek5jQXFESk8wVjdC?=
 =?utf-8?B?S1ArZUhNckxoOXBMd0gvTWRIb2NyNEJTR21SeGphK2lRb1lZaEtzMGRBb0NS?=
 =?utf-8?B?eHl2eURXd2hFb29MeGlDaC93RVdzaEpKN3pkekMrVHZxYzIyQ1lZNEM3Uy82?=
 =?utf-8?B?ZGZ4VmdESi93Ni9VVzNKUXpKaytGemtvRW01VzFiaWtHVWt0aUpwSzJmVzAz?=
 =?utf-8?B?TVZTbEZkdk5CMlFmN2VjTGxqSmN2UkVQeDhSV0VwM3NXZXg0YUdMYzNQMENI?=
 =?utf-8?B?czVLc0RpNnZhakxSdEZsT1VwN0t3d3dXSUNzSjBIZ3JkQVNQNFZENUZ4UnZy?=
 =?utf-8?B?MzhheHpFeXEzQkptNXJJNVNoUTFuUXp4SWd1Z2JNeXlOalJ6NGRmeGdSNU5Y?=
 =?utf-8?B?TTNqRmhRVGR3QytzYkdjdmFycllnQjNMTVU0SUYyQ2tDdE94YW04aVdLeVNO?=
 =?utf-8?B?OG9GeDVLRks0SVVpbHlUSjhqVlMydXRIZi9xOTVaWG1sT1FBRlVUTk5YaXdT?=
 =?utf-8?B?UGN2bEJTR09hVFJEbkptbTRzQ0h6WXFkeFllMGZ3KzIzb29CeHc2ckkzV3VY?=
 =?utf-8?B?Ym9nanVpajZjZDJJWDd4OHhqaktLeGcwVFFzclRCQitFRkZ2Wi9MbURCUmx5?=
 =?utf-8?B?akhrR0hyWlh6RC93TkovR3grUHJOQUhscS80N0RkbFdKNFhRL0FjUFNLaGRU?=
 =?utf-8?B?ay9uTFh3WjN6dGdubnJqb1ZLbE1sTHZtcWIwWmVQdUN6R3c0bmZvU2o4NFBF?=
 =?utf-8?B?ZnAvSnhRN2QxVzJZUUkrcmV5amdzV0psYk1SQXQrU00yTHhZU2JLRnduTGRZ?=
 =?utf-8?B?azZpUm5PNXdkU0dLb3AycFk5UjNVdElVWUpvcTFCMy95bTFsQUhsbVE2Y284?=
 =?utf-8?B?TTNDSDVIc3lOS2lCWDBJQW9NamlxelJ3NjNUSVZoOXlCNCtBR21JcTJjc3NS?=
 =?utf-8?B?c0I5bmhIVlhwenRRU1RPOWYyVGVscG51bG9RQ216WVMrZm1NNjMyOFB2TVQ4?=
 =?utf-8?B?b3VMeWhJU1gxTmptNmRJc2xscnh2ZVpYQ3l4Z3BrYU9FckxJM0VOcWg3UEdQ?=
 =?utf-8?B?ZEh5NE9rRDNrNlNLV3hKbVZqSjBsME5QOHR4VkRFTUJ0TWxLdERKSk43bEp5?=
 =?utf-8?B?ZThGNm5YZm9uUUVEeWFEZVBMaVY3dVhGTUJOOVdabnVrVE9OYndNaXhCdnhy?=
 =?utf-8?B?TU55a2dKb056b0N0NTQxL0Q3RWVCblVQM2dLU0t4WWtoY1lsdCt3T3Zxc2dj?=
 =?utf-8?B?bS9mVkxSYjY3eE5jTHpOSEIzMWY5Sk9NemNjckxCWURZY1crZklvWmpJb294?=
 =?utf-8?B?Y1NRKzRMR1lUSm55dVNHcE56NGpUNFZuekcyREo5MTM4UGRvN1RuWFgyeW9R?=
 =?utf-8?B?NDFHYnBQTG1SdUVlcXQ4RG81ZTcxbGhnMXYzYUtJeWgyaEpRYkVONm1sOXlh?=
 =?utf-8?B?R3NiQlhiS2FjWmFUeUdtNnNkTkJCQkdlS1BvQWdFQmcySHlhV0lsdzNjZno0?=
 =?utf-8?B?SHBjc0x6UmVaQ01Nd243cFpIVHFKcEI0UzNQcDFTM01Dak0yNWpOelZBbXdx?=
 =?utf-8?B?ME5pdkRrUEtnKzRNNzM4QW13enhwaDVQajU4Z3NCY1lVaVF0a1NjdldCZnFU?=
 =?utf-8?B?RWp5SmplVGFNcHc4YUNPeklmT1IrNHBUTWY2aHlIbldOajNjUkZCS25rakNz?=
 =?utf-8?B?eFFneUdzMmpPa2RZMCtueGZ6K29aTDZtSjZDWmErR3BGTG9EVjUyN1p4UGJC?=
 =?utf-8?Q?AcBsxJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3hLR3BpS05BMjRpek8xbVVUTFhQM3lUcEFaWldRUGxhcmkxZ21QWWoxVHdJ?=
 =?utf-8?B?RGFpTzQzd3RBNVNZSDZuV3U3OC9YMXpzQXBXcGpRaEx2U3FVNlFFa1JITDNr?=
 =?utf-8?B?VE5SL0hwbFg5c3Y1L21aS3VoUTE3eFk4RTUxWE9aTCtuNnR6ZG9vSTFVenBj?=
 =?utf-8?B?TDI2enU2Z2o4UUJoK0UvRlpUSWkvODJUb0tLdk1OK0JiZzk3MytOOUxQU0lt?=
 =?utf-8?B?YjZDcU9ML1lETlI1cXlBSkI2OEF4UktFNDBMcVI0Qnp4aFQ0U0c1SUk0MnpX?=
 =?utf-8?B?blY4UC9UalhZZTdWTVVBcElLY1dkdzNMSTR3c0lMRUNRV2NqdGRYVll5ak0z?=
 =?utf-8?B?YlN3WGo1MnRlL2l4S0RSVmFaUzlzOGtzeGh3VTM4aWtKdThyQXB0d21vbVdE?=
 =?utf-8?B?Vkowc0JFcVlSQVdJSHp1UUhRRnpobEhsZG5EOU16L2NGWGRiQzRTK09HSGd2?=
 =?utf-8?B?MWRqRUs2QXNUK2NIUEsvaFhRMHVPLzUvWGJGUjlmQ0kraVFINW9NMFplSjNk?=
 =?utf-8?B?TDFNZ01lYXpRbWM4L0podzdaRTc5NXZvd3ZkZDJvcUpKVW12TGM4ZkpOK3FT?=
 =?utf-8?B?b0pFZTlKVkFpUXlTZEtvNEdjdFFKaEZJeG1HVGgvQmpPMnVXVzFDOXd3QUth?=
 =?utf-8?B?ZGM4QlRISmk0V3NzR3Y3ZU53OXg5eFEwdFI1cEZhT1RCWXpiRWszaEhuZFh5?=
 =?utf-8?B?SEhTWnZxTHhtZW1FZ092ZjdnSW9OSFdidzZ2eVVXSlJMblBCWUxZdFpuVzVL?=
 =?utf-8?B?eDJqOURsRnJVd2NhSGxOOXE1b2o1TC9DOGp5L3RCdDZmS3d5aEtzRkdNaWlW?=
 =?utf-8?B?M3hXS2hKQnRucUVZakRuelBTVXNJK2hkalptTld2SFc3MUVoZkxMWVBpV2lK?=
 =?utf-8?B?aS9SckNldHFOWWFqVFpBM2tzczZyc1puMm5OK01JQzcxdU5vbHJBQnRtU0hH?=
 =?utf-8?B?b0lYTzVEb28xTlY1K3NtRU1GWDBHSXhVdUg2aGFYUTlseDZPN2VDbFlxM1Ns?=
 =?utf-8?B?VW1HTGlFY1dIam9JZ1BjK2RFQ2ZUVlhKUGNVUWc1QkpzQzgySHFRMVl2QzNV?=
 =?utf-8?B?d2N3MmdDNGx2MWZPMXRLbCtnT2FsWHBOY1JvNlZMWkc2WVQvWnhNb0NaMFJ2?=
 =?utf-8?B?bFRpSElLUTF3bmZheW0zK2UxQTJOTEJMeXBVYXl6VTlpdDVGcFdnd0xUcGpZ?=
 =?utf-8?B?UWY2WFlGMk1CNTJTeTVNd283bU5qd2RBSzFjNzBGUVJRQU83ZDB4Rlo5OFpV?=
 =?utf-8?B?MjRMZS80eVBXcXVXTEVzelBCVlo2UXgvY0dJQXBhMldHOEVLQ1FSaXd3ZWFx?=
 =?utf-8?B?dE56UzRvTVdJcnlJaS9FV05tbjhvaDh5SlYxTjNzNm0zSjRsdS9BZHAvYlht?=
 =?utf-8?B?citodi9qbHgwcFFRdmtrb0wyOWpjaTdzTjlYci8rM0o1c2VtSXI0MFdoVTFs?=
 =?utf-8?B?aVFVa3hzd21uSVpiKzRjMFdmZG1Ub0Z5RVNZS3Z3Q1dOUTN1WnBXYjI1aWUv?=
 =?utf-8?B?Q0NjY3QySmlqSFVmdllKeWhDZFRJM3JqbTFaNjhHdFNITkxLRlhFVjFNT1pr?=
 =?utf-8?B?QWxUbUZRakNSMEZUdHVyNmhyOWFkcWwzbmQzQ3kyUERTZTBmRWc5K3hScTZP?=
 =?utf-8?B?bDdRZ01Sd1Q0cU05SHFVUmZqanhBRmx4SUVwMkY3WUYrdzRaUngrY2VlQ1lh?=
 =?utf-8?B?TUtFcU9WT3MvdExFUktDenRMZWx2WTE4bm53ajdGS0RkMWF3T0VoNHRDempJ?=
 =?utf-8?B?OUVHc0NDT0kxNElCNm12RHJFSFFPWWplNy9YRGpTRkoyRFR5SW9GMEFVeW83?=
 =?utf-8?B?dnJsTFh1M3ROWGt0RkdWTWNKanl6c2kxN01ZY0JZM29SRkF2U3B4bXZlRUYw?=
 =?utf-8?B?U2JUbnBvRHMyRTNQYTdRaDEwYTJ0QkFIMUYyT2p5UGlnUlF0ZDJ3c0R5TkRU?=
 =?utf-8?B?dnV4QnFLMTVCRHVGOW95TFY0Z3N0QURWZEs4amJpbGlGTzFKbFVzS1RjcFgy?=
 =?utf-8?B?cEVYaGJnNnJ0SU9QeEU3M0dDbXlzdDY0U0xZTDdjcStSZTkra3FPd1k0WTRC?=
 =?utf-8?B?RGtrZFg1TDF5anZnVEJYSHgrN1lEdkRCc0VNZzRxandvZDd1b0dYUEZTRGRY?=
 =?utf-8?B?dzJvRDRBclQ0TWxJc1RxTDlEV09pci8xT0RFdDY2SU1keGgzU1pHYThkd3VP?=
 =?utf-8?B?MXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FA22B9201EB9D42B820C9660E896A07@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0b8bf8-32b7-43bb-2b52-08de1897fbd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 16:10:17.7058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DWOlIDhzSxZS6r49/Qj1lJI0EaXLD5Wm1pygzE66YGR9ZewyAtZgmuZZDbqxkj+xoQissyLCdT30DFiwNmXlevKXXlJxT2UfhSLPvIHsGnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF9E162731D
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

T24gRnJpLCAyMDI1LTEwLTMxIGF0IDIwOjIzICswNTMwLCBWaXZla2FuYW5kYW4sIEJhbGFzdWJy
YW1hbmkgd3JvdGU6DQo+IE9uIDMwLjEwLjIwMjUgMjM6MDgsIFN1bW1lcnMsIFN0dWFydCB3cm90
ZToNCj4gPiBPbiBUaHUsIDIwMjUtMTAtMzAgYXQgMjA6NDEgKzA1MzAsIEJhbGFzdWJyYW1hbmkg
Vml2ZWthbmFuZGFuDQo+ID4gd3JvdGU6DQo+ID4gPiBDYW5jZWwgYW5kIHdhaXQgZm9yIGFueSBE
ZWFkIENUIHdvcmtlciB0byBjb21wbGV0ZSBiZWZvcmUNCj4gPiA+IGNvbnRpbnVpbmcNCj4gPiA+
IHdpdGggZGV2aWNlIHVuYmluZGluZy4gRWxzZSB0aGUgd29ya2VyIHdpbGwgZW5kIHVwIHVzaW5n
DQo+ID4gPiByZXNvdXJjZXMNCj4gPiA+IGZyZWVkDQo+ID4gPiBieSB0aGUgdW5kaW5kIG9wZXJh
dGlvbi4NCj4gPiANCj4gPiAvcy91bmRpbmQvdW5iaW5kLw0KPiA+IA0KPiA+IEFuZCBzaW1pbGFy
IGhlcmUgLSBjYW4geW91IHByb3ZpZGUgYSBzdGFjayB0cmFjZT8NCj4gDQo+IFVuZm9ydHVuYXRl
bHkgSSBkaWRuJ3Qgc2F2ZSB0aGUgc3RhY2sgdHJhY2UuIEtlcm5lbCBwYW5pYyBoYXBwZW5lZCBp
bg0KPiBEZWFkIENUIHdvcmtlciBhZnRlciBJIGFwcGxpZWQgdGhlIGZpeCBmcm9tIHRoZSBmaXJz
dCBwYXRjaCBhbmQNCj4gcmV0cmllZA0KPiB0aGUgdXNlIGNhc2UuIEFsc28gdGhlIGlzc3VlIGJl
Y29tZXMgc3BvcmFkaWMgYWZ0ZXIgdGhlIGZpcnN0IHBhdGNoLg0KDQpNYWtlcyBzZW5zZS4gSSBk
byBhZ3JlZSB3aXRoIHRoZSBjaGFuZ2UgaGVyZS4gV2Ugd2FudCB0byBtYWtlIHN1cmUgdGhlDQpz
dGF0ZSBpcyBjYXB0dXJlZCwgYnV0IGJ5IHRoZSB0aW1lIHdlIGdldCB0byB0aGUgZ3VjX2N0X2Zp
bmksIHRoZQ0KYXNzdW1wdGlvbiBpcyB0aGlzIGhhcyBhbHJlYWR5IGhhcHBlbmVkLg0KDQpTbyB3
aXRoIHRoYXQgbWlub3Igc3BlbGxpbmcgY2hhbmdlIGluIHRoZSBjb21taXQgbWVzc2FnZToNClJl
dmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KDQpU
aGFua3MsDQpTdHVhcnQNCg0KPiANCj4gUmVnYXJkcywNCj4gQmFsYQ0KPiANCj4gPiANCj4gPiBU
aGFua3MsDQo+ID4gU3R1YXJ0DQo+ID4gDQo+ID4gPiANCj4gPiA+IENjOiBaaGFuanVuIERvbmcg
PHpoYW5qdW4uZG9uZ0BpbnRlbC5jb20+DQo+ID4gPiBGaXhlczogZDJjNWE1YTkyNmY0ICgiZHJt
L3hlL2d1YzogRGVhZCBDVCBoZWxwZXIiKQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmFsYXN1YnJh
bWFuaSBWaXZla2FuYW5kYW4NCj4gPiA+IDxiYWxhc3VicmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRl
bC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5j
IHwgMyArKysNCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+ID4g
DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+ID4g
PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiA+ID4gaW5kZXggZTY4OTUzZWYz
YTAwLi41MzY0MzNiMDYxZmMgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX2N0LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0K
PiA+ID4gQEAgLTE5OSw2ICsxOTksOSBAQCBzdGF0aWMgdm9pZCBndWNfY3RfZmluaShzdHJ1Y3Qg
ZHJtX2RldmljZQ0KPiA+ID4gKmRybSwNCj4gPiA+IHZvaWQgKmFyZykNCj4gPiA+IMKgew0KPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ndWNfY3QgKmN0ID0gYXJnOw0KPiA+ID4gwqAN
Cj4gPiA+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX1hFX0RFQlVHKQ0KPiA+ID4gK8KgwqDC
oMKgwqDCoMKgY2FuY2VsX3dvcmtfc3luYygmY3QtPmRlYWQud29ya2VyKTsNCj4gPiA+IA0KPiA+
ID4gKyNlbmRpZg0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGN0X2V4aXRfc2FmZV9tb2RlKGN0KTsN
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBkZXN0cm95X3dvcmtxdWV1ZShjdC0+ZzJoX3dxKTsNCj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqB4YV9kZXN0cm95KCZjdC0+ZmVuY2VfbG9va3VwKTsNCj4gPiAN
Cg0K

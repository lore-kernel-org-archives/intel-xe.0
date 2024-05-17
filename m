Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC851C04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 17 May 2024 18:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC1210E338;
	Fri, 17 May 2024 18:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nWZrCYio";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A34F10E338
 for <intel-xe@lists.freedesktop.org>; Fri, 17 May 2024 18:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715971364; x=1747507364;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=+cgqVlW7H1oe//Vo7Sn3l1ZmKORoROfYFCRsDarv+co=;
 b=nWZrCYio+nTXYkYZGb8Z8to4SuZJqCivpam98JsPy/C3M1SsW8k7r/ri
 JlgZwciPzx2HBaIDn40lAETnNgZQk7uONXkYDm/GWaW9Xbr9VFE903ld3
 s4pRX1yKlAJ3HP5l+tqYNMbQGaTGI+qetjWvdacmBhKZ34l47ULKpFra4
 YL2tJSrf9PEieLAWodCzetZxzjGRtWtHS8gp+8UMio/HdRnvoBvgww++9
 bQchJn0cbdK5Ayu9AJJnsyz6sKA3fD5oDGJ3KXD0ePfYRx2/BIpm3KqjI
 b1nCO5krqHOVG3eLGcwLGXp+adSz+/RpNLh2vT57xOEv9z0YDfybWGQFx g==;
X-CSE-ConnectionGUID: znYdeLfHSISP/ENx5WdkXg==
X-CSE-MsgGUID: ZdCmD1AnSY+1cDnY9KWl7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="15998830"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="15998830"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 11:42:43 -0700
X-CSE-ConnectionGUID: vbjVFF8DSCKd/U40JvsyzQ==
X-CSE-MsgGUID: Ji/4pUNoSOui2vk+nuJxvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="36613619"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 11:42:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 11:42:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 11:42:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 11:42:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 11:42:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bujhhyKbIVqe6KnAdSoohvEa70fTiuOfTg8FI377xqvffvoBygdNNHRlgchHo0ehoPGUxWNWlYUJ1OfMGt1Xm2YP6t3ULZtDHq1+gMd46kgeZFstbvnBVcEhJQ+KF+lqJLTJb20vMEvUh1rXtzzRxat9LT38k3s/cTCQ2ha2nI8wEQ0AIEbvUPcQl1l4brCvAbMjNqYySk3bpACIqVubiqy2Dv9XIlnVjZbL0G5walPxB358pIaaBRwCtlUvnwBVv3aGvsYmsQlUwthQ0vwtXc18ETHHJFCFsxRAdrhij0sc3V6uTQpAgNuqzu+D4VcA+qkGhlJG7wO7KmzNN5VHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cgqVlW7H1oe//Vo7Sn3l1ZmKORoROfYFCRsDarv+co=;
 b=EcG/3uOBiNBSoqTfEh+4MxsgPtt9OAt+ASKKOopIeGDnXfOlIG6LuUKQKpI1a62bA6IFR2ZkK3dygNzXRIYGEdP+Owmo/fvSTAbIpi163Ixbqn1MTV3SNpLePEWJIoendwGq5gjrZJtfm9vJCNNincVBs5C20ZjBPuQtCJ4U77UU9uRvWnA+Pq/gx5ooTA8mf30oBhKbi+GPpWYFPFBpmbVEopSBdt+y2hqpMa77nSr7W2ELkQobcj7M6Mv54RPu3CMTDnnS+e7jxuAPOBKS+8xY2miN1uCyPywNbRsmPjLH6VtgNpQ8yK5Qg0DVSi6YbDE95Cnq22fsvPxGUDpvmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM4PR11MB6526.namprd11.prod.outlook.com (2603:10b6:8:8d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25; Fri, 17 May
 2024 18:42:39 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 18:42:39 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 00/17] Add OA functionality to Xe
Thread-Topic: [PATCH 00/17] Add OA functionality to Xe
Thread-Index: AQHadnkcIUwutN2VakWosatViFIW8bGcJwYA
Date: Fri, 17 May 2024 18:42:39 +0000
Message-ID: <438b276a653bf56fe1e0e131709d615dec86ae3e.camel@intel.com>
References: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM4PR11MB6526:EE_
x-ms-office365-filtering-correlation-id: dec26779-910d-4eea-4c2a-08dc76a120e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?aWRNbTFvOHBUZm5LK1pTbS9CeVFvMUxMaDZUWUh3d3JZeGw2U0lKQjdVamR6?=
 =?utf-8?B?aUo4Yk9VUFhqUm9RRlh3UW5SZ0ZieUVpTm1rRncxUlkxTzAyTkhXbnFHckpj?=
 =?utf-8?B?U0ZJcGFseHlPZWZkUnRsKzVKQTVVV2o0a0R0TFpBOXpHbFpnaThzSDdSSXB6?=
 =?utf-8?B?Ty9zcGw5bitBaVN6ZXA3Qm1pc1FpbFljUjQyR2FFUmRaRm1LT2t5dEhNQnh4?=
 =?utf-8?B?cm5DMVI5ZW5oWDVJZU1KQzhSdktuUzR4Uy9IbWJrUVM5SHQ4U1RhVUdCTFF1?=
 =?utf-8?B?U1owSUlhaVBHUy9DR3ZMVUszaHJFVGxibHFIbVE2Zyt2TVBjTGsxYVBNdkd2?=
 =?utf-8?B?RGRDVzUxOWVsWThHRDcwWVEvRkZ0ZXVQanUyWTJHZDRZMHlFQld0UDd0aXVC?=
 =?utf-8?B?cy80cnFBSW82a1Z0R0gzWGFLb2Fnb2dLU0hxU1N0c0xDeSttOTYrNXkva3ds?=
 =?utf-8?B?QU9VSzVNUVN5NWg0M2xLTWlzNE5URHVyQ3lKZ1FMWGtwR1o1dkd3dFN2U2Rr?=
 =?utf-8?B?MU5nWkJtMUMrYUMwRlJKZWJhaTg3bEhpRzhmUGlMNlBKME1kY0I2bUsrcG1Y?=
 =?utf-8?B?T1c2dWJqQkN3d2JqYk1xZHlsL2tMQnlnRVBOZHduOXRYWWR0Tjk0KzFGME5i?=
 =?utf-8?B?bG9ZUVllTlhRS2xhOExoK0ZZUXhYRXkwbkMycXRzTzM4SmNwWDNIa1NYbGFs?=
 =?utf-8?B?QjZwN2dTN2FmTU9udmowWklqTUlYYVRtdTFEMTZCT29XdmhCbEpnZ2xRbmRR?=
 =?utf-8?B?dGpQVm5EVWptMkRBbUpLTGxsVnhKMkNsK3kwdkFnOWlYdUs1RU1yL1RXNlNp?=
 =?utf-8?B?UWdRRGRiYkFjSE5CTWVBbk9vMTVXelpoL2JVVVozUzdJZERMbjVJQjdjWXF5?=
 =?utf-8?B?RmxURGd6QW4vNkRSdXA5bkpYWEhxMXQ4Qmh2ZjdTdGlzVzZuR00zbUFpV0lT?=
 =?utf-8?B?Vi82alI5ZE15SVRwdm1VaXlYNTVKQUE5dTZ1SDgwYUEvQk9RQzVja0FoYnFH?=
 =?utf-8?B?YkJubTEvODNNUmhvZ0pKRmxVa0h1Vmlaei9BZW1nZkxneW9SNTJ2dDMvZS9V?=
 =?utf-8?B?TjV4dTNROFUxM015MlZGNFBjcmZ3cEZNYm1nVkl3STRlNllseXZnSTZGYmNY?=
 =?utf-8?B?Q01lZWFaWFEzcXFrYVVKbTNQSGdrVGl6SDJhUUc3cUJWeDdxaklGUThtOUpV?=
 =?utf-8?B?ZTlDbWdTSndNUW8wOVFYTVVGcEY2YVc2aElQc1EzcURwMU5GZllFajEydUNm?=
 =?utf-8?B?UWNTcWNvMnVtSGR2dWN5OFlZSC9vd0RwYWQ4RERiY1BqS21KNmphUVJnbnEw?=
 =?utf-8?B?djhVd3lLVEloZWZYc1Njbmk3L3orRVkvMU4zTlk0V2tCVFYvUkM5YTRMSVVN?=
 =?utf-8?B?Rkprc2VxSDBMTk9hU0RBR051VTl1Q0lXWGUvTWlucTBEWjF4SzFoV1pqOTJ0?=
 =?utf-8?B?RzNONzB5TnI5Qk5TcSsvZ1NWZ2hOSXdmbHBRQmlLK3hzcyt5UzB1TENXZHBU?=
 =?utf-8?B?ai9zdVF5WnR5bzMwb3lKbU5PblZMZHkvaStqeEZmMjhnNTNDZ1oxdkNvZTFa?=
 =?utf-8?B?THJPa1k3TGxZTEhKVnVxQ2s3Y0FpeVNxZ1VVZWlxOXkrOVdlTjJvUkJyeDZy?=
 =?utf-8?B?Nys4NXpwejkxRjhwcjNxL01ibnoxcmczR1NKWE1NZ1VJVUxiQkFRQXZaNWVB?=
 =?utf-8?B?Z3ZHU0cwbEJQUlU0WEQ5WGdaUjBhVXZmSVZHQUtuK1Y1ZUZNQ00va1lVNGZz?=
 =?utf-8?Q?gq2ZMFnuynucgPXvcA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUw4TDUxTUxNS0w5bk5HNFJGeGpISTF2RWR5R2FRRkJwUzZZY0IycVpFK3dB?=
 =?utf-8?B?OUpDVXEvVzJTV0FaSHBuMFhscjEwMkZtazZJL0Y3Q3FqaVZYb05mOUZrUzl2?=
 =?utf-8?B?YVFzWDRDQmZwZHk1Q0xLemVySWNIem9mb20vWS9yN1lJS0xDdkVkTUVNWlF6?=
 =?utf-8?B?UzBJKzI2UWRzV0k0ME81S1g3aERNdS9CTVQrNWJyN3dEeTZxVUhJZnZxaFg0?=
 =?utf-8?B?NlVGcVFUZHVUSjJDYkVjZmI2Wk9KR05OQUE3bnVOS3NOWjBHZW9Za2MrL0Fo?=
 =?utf-8?B?RTIxd0h0Y1gya042RTZLZzRwRXI4dVhMeHMrRmVPbWpGdkNtMEdyclNvWmt1?=
 =?utf-8?B?STE5U1M0TFQ3NURXMmdVMG9BYkVvTU9nNnk3RUxJUmpmOTJFdHRGalNESGdJ?=
 =?utf-8?B?aHJPcUREazVzaklVc2s5WWt6d0VoRndKeEZKOUlpU1VaalB2U0V3eWFNU3Br?=
 =?utf-8?B?dlBIbUE4SnYvL0hhRXNFSmNLRnRxYVlhZS95aVZMNmQrcG1KR0VGVnVxK0Zr?=
 =?utf-8?B?Zk9Gdy9YTWpDNHgvSHI5NUNFbXVLb0pUamd5VVRFVmd5MTBmWkJid0N1Sklw?=
 =?utf-8?B?K05MQVFEU05YSGprSFlGQXBvYi9kbGoraWQ2dUprK1luSktUdkVhRVZkRHcy?=
 =?utf-8?B?V1RDT0tnWHVzUDJmTC9KT3NldXRFS1FNNnRMWlpTSTREa0ZTL2dRdnlqWERM?=
 =?utf-8?B?MHllRE4wSWN2Q2hIK0RoZDc2UFZINzZUK1hza2JyWHFEbTdSMEVHTDQwcXp0?=
 =?utf-8?B?UUNSdzAwRlhPM2tNQ0s0aDJ4OWN2dk9haEd0RmdicngvbDh6OTlyLzJ6VmpE?=
 =?utf-8?B?UU1BM1ZPeitjSEVFREpvT2dHL2ZtOUxFOFhhN0w1eHE1YTRMSjMxdUVabjQr?=
 =?utf-8?B?TldEOHVaMk12aWdXelVHY0d5dlhBSFlJS010VjMxcVFWZHhyZDB0Z3hNL3Bn?=
 =?utf-8?B?aXRIMk1GZi9VUlBUajRLVkRzSmtFV2dIVWExUmRsbEVZN0ZjQXB3a2Vja0dP?=
 =?utf-8?B?eTBnL3lrdUE0NlAyanlhK0pNVWRmamRBZlMwcWFIT1dObkpHRDh4VzZQalhX?=
 =?utf-8?B?Rkc0WVlNclVDR3pCWURtQXNuRjhwbWlLSGR6NmJsUllaL1BXRzFhVHlNOXB5?=
 =?utf-8?B?dGtVbXBkMHVlQkgyRmpNbmtkWloyN3F6akt3NDlYbWxzN0pmdEZKM2NJWDdT?=
 =?utf-8?B?bTNCZ2s5a0liMFZ4K281TzBEM0lERFJDQjU4M0xkd3owQ1Z3bEFSdHFNY0lm?=
 =?utf-8?B?b2VpM2d2NTZDRWk0djJxQVRGR3drMDIyVGR2V3huRDRtdGJqcFdPQ3pOSHZw?=
 =?utf-8?B?NUd4ZTdOZ0FsWC9WbDhXQ0FzclkzNXhrS084S0pVcTZNUnNQZmk5YURYb1Iw?=
 =?utf-8?B?VzdKYkV5UjR1TmxmWXBQbmdtbUdOa08zek5UenMxUDVGQk1QMWdvYlFvWTQ0?=
 =?utf-8?B?V3dLZDJpS3U1WGpydW85Mklyb1JzV1RnUUdJYkUra1A4cXEzVzIvSDlGYkNS?=
 =?utf-8?B?WEdBTFZLdmk0VmFRYmcvSVM4SXNQbnFsenhYT0QyYTB1b2ZrQ2NNai9LVjIz?=
 =?utf-8?B?aUpDc3cyY2RzNS9lK1ZUSG1vNDYvdFU2bkI4RFAwd01rSEFidEpZSzk2NE82?=
 =?utf-8?B?aStQMDd2SUQ2UjhPVmhpbkVCNUFJMmJ1ZEhVUXVVOG5Pam1sQ3lFVGNRM05B?=
 =?utf-8?B?UURBLzZ0U0F3SEhxRnJrNjRHOHUxajA1MTgxdy9RNytVMmRlVlVIdmhWYUd6?=
 =?utf-8?B?bGpua0pOTmpkL2JNV2Q5Z0p4Rk9qVkVTWnFBSTQvN1FTd1AwQnpIN1NhWXFW?=
 =?utf-8?B?M3cvSEd3ZHl3SkdiQzEzTDkybWtGKzhmOGJ2d0laR255cTZyRmdLOVl5YzU5?=
 =?utf-8?B?SEVFTVhGb2I5by9UTEZjeW1PQnRxUkllVUZBbXFrT0RSZVRHZUdEOEpVd2RH?=
 =?utf-8?B?ZXM0RlBoRm5FMWxmZnltMlp2VjlrWnQ2dU8wM3BqekJwd0laeFdycnZ5YlFh?=
 =?utf-8?B?VWVSTnpGUWNsNWRGTXNRY1c0SzN4dHVQT2I2aDBsRlpKTE1KLzBLSDIxbUZw?=
 =?utf-8?B?OFlaQXJ3S1VHbVJQTXVZdHkyZ0JQMm1nek9iWEh2K2VuekdVVjNZSVAwWHBP?=
 =?utf-8?B?ZVlxM3BGT2FNWTl6UXZBUmlxSDZZL1Exd2NSY210TUFTa1dQRUROcHRVMkUr?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBE4797E190CB54C99B773258ADDB92F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec26779-910d-4eea-4c2a-08dc76a120e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 18:42:39.3242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aufm8nDFPQoZVFAqWw76iMsMC30jx7k9LyV7C/m38W1QB8btoCJB1S1LW66LlUTAll0lhOp+5PkBX4tHZKSj+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6526
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

T24gVGh1LCAyMDI0LTAzLTE0IGF0IDE4OjM1IC0wNzAwLCBBc2h1dG9zaCBEaXhpdCB3cm90ZToN
Cj4gUGxlYXNlIHNlZSBjb3ZlciBsZXR0ZXIgZm9yIHY3IGhlcmU6DQo+IGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTIxMDg0LyNyZXY3DQo+IA0KPiBGb3IgY2hhbmdl
cyBpbiB2OCB0aHJvdWdoIHYxMCwgc2VlOg0KPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvc2VyaWVzLzEyODk5My8NCj4gDQo+IEZvciBjaGFuZ2VzIGluIHYxMSwgc2VlOg0KPiBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEzMDcwNS8NCj4gDQo+IFRo
aXMgc2VyaWVzIGlzIGFsc28gYXZhaWxhYmxlIGF0Og0KPiAgICAgICAgIGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9hZGl4aXQva2VybmVsLy0vdHJlZS94ZS1vYQ0KPiANCj4gVGhlIHNl
cmllcyBoYXMgYmVlbiB0ZXN0ZWQgYWdhaW5zdCB0aGlzIElHVCBzZXJpZXM6DQo+ICAgICAgICAg
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2FkaXhpdC9pZ3QtZ3B1LXRvb2xzLy0vdHJl
ZS94ZS1vYSwgb3IsDQo+IAlodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVz
LzEzMDAzMy8NCj4gDQo+IHYyOiBGaXggYnVpbGQNCj4gdjM6IFJlYmFzZSwgZHVlIHRvIHMveGVf
ZW5naW5lL3hlX2V4ZWNfcXVldWUvDQo+IHY0OiBSZS1ydW4gZm9yIHRlc3RpbmcNCj4gdjU6IEFk
ZHJlc3MgcmV2aWV3IGNvbW1lbnRzLCBuZXcgcGF0Y2hlcyAxMSB0aHJvdWdoIDE3DQo+IHY2OiBO
ZXcgcGF0Y2hlcyAxOCB0aHJvdWdoIDIxDQo+IHY3OiBQYXRjaGVzIGFyZSBjb21wbGV0ZWx5IHJl
ZG9uZSBhbmQgZG9uJ3Qgc3RhcnQgd2l0aCBpOTE1IHZlcnNpb24gb2YgdGhlIHVhcGkNCj4gdjg6
IFNlZSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNTc1MjE0Lz9zZXJp
ZXM9MTI4OTkzJnJldj0xDQo+IHY5OiBTZWUgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3BhdGNoLzU3NzQ0MS8/c2VyaWVzPTEyODk5MyZyZXY9Mg0KPiB2MTA6IFNlZSBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNTc3OTQzLz9zZXJpZXM9MTI4OTkzJnJl
dj0zDQo+IHYxMTogU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC81
ODEyMzkvP3Nlcmllcz0xMzA3MDUmcmV2PTENCj4gdjEyOiBBZGQgbGFzdCB0d28gbmV3IHBhdGNo
ZXMgdG8gZW5hYmxlIFhlMisgb3ZlcnJ1biBtb2RlDQo+IHYxMzogVXBkYXRlIGxhc3QgdHdvIHBh
dGNoZXMgYWZ0ZXIgY29kZSByZXZpZXcgY29tcGxldGlvbg0KDQpIaQ0KDQpJIGhvcGUgSSdtIHJl
cGx5aW5nIHRvIHRoZSBsYXRlc3QgdmVyc2lvbi4uLg0KDQpKdXN0IGEgZmV3IGNvbW1lbnRzIEkg
aGF2ZSBpbiB0aGUgdUFQSToNCg0KLSBSZW5hbWUgRFJNX1hFX09BX1BST1BFUlRZX09BX0VYUE9O
RU5UIHRvIERSTV9YRV9PQV9QUk9QRVJUWV9PQV9QRVJJT0RfRVhQT05FTlQsIGZvciBiZXR0ZXIg
Y2xhcml0eS4NCi0gU29tZSBQZXJmIHVBUElzIGFkZGVkIGhlcmUgZG9uJ3QgaGF2ZSB1c2FnZSBp
biBNZXNhLCBzZWUgdGhvc2UgYmVsb3cuIE5vdCBzdXJlIGlmIE1EQVBJIG9yIGd2aXogd2lsbCBt
YWtlIHVzZSBvZiBpdCwgaWYgbm90IHRoZSBhcHByb2FjaCBpcyB0bw0KcmVtb3ZlIHVBUElzIHVu
dGlsIHRoZXJlIGlzIFVNRCB1c2luZyBpdDoNCgktIERSTV9YRV9QRVJGX0lPQ1RMX0lORk8gKyBk
cm1feGVfb2Ffc3RyZWFtX2luZm8NCgktIERSTV9YRV9ERVZJQ0VfUVVFUllfT0FfVU5JVFMgKyBk
cm1feGVfcXVlcnlfb2FfdW5pdHMgKyBkcm1feGVfb2FfdW5pdA0KLSBEUk1fWEVfT0FTVEFUVVNf
KiB2YWx1ZXMgYXJlIGJhc2VkIG9uIEhXIGRlZmluaXRpb24sIEkgdGhpbmsgaXQgc2hvdWxkIG5v
dCBmb2xsb3cgSFcgYXQgbGVhc3QgZm9yIERSTV9YRV9PQVNUQVRVU19NTUlPX1RSR19RX0ZVTEwg
YW5kIGF2b2lkIGhhdmUgYQ0KYmxhbmsgc3BhY2Ugb2YgYml0cyBub3QgdXNlZCBpbiB0aGUgdUFQ
SQ0KLSBQZXJmIHN0cmVhbSByZWFkKCkgc2hvdWxkIGdpdmUgdXMgYSBoaW50IHRoYXQgZHJtX3hl
X29hX3N0cmVhbV9zdGF0dXMgbmVlZHMgdG8gYmUgcmVhZCwgdGhhdCBkaXNjdXNzaW9uIGlzIGFs
cmVhZHkgaW4gcHJvZ3Jlc3MgdGhhbmsgeW91IGZvciB0aGF0DQoNCk90aGVyIHRoYW4gdGhhdCB0
aGUgdUFQSSBMR1RNLg0KDQpUaGVyZSBpcyB0aGUgaG9sZF9wcmVlbXB0aW9uIGZlYXR1cmUgdGhh
dCBpcyBtaXNzaW5nIGJ1dCBJIHRoaW5rIHRoYXQgY2FuIGJlIGFkZGVkIGxhdGVyLi4uDQoNCnRo
YW5rIHlvdQ0KDQo+IA0KPiBBc2h1dG9zaCBEaXhpdCAoMTcpOg0KPiAgIGRybS94ZS9wZXJmL3Vh
cGk6ICJQZXJmIiBsYXllciB0byBzdXBwb3J0IG11bHRpcGxlIHBlcmYgY291bnRlciBzdHJlYW0N
Cj4gICAgIHR5cGVzDQo+ICAgZHJtL3hlL3BlcmYvdWFwaTogQWRkIHBlcmZfc3RyZWFtX3BhcmFu
b2lkIHN5c2N0bA0KPiAgIGRybS94ZS9vYS91YXBpOiBBZGQgT0EgZGF0YSBmb3JtYXRzDQo+ICAg
ZHJtL3hlL29hL3VhcGk6IEluaXRpYWxpemUgT0EgdW5pdHMNCj4gICBkcm0veGUvb2EvdWFwaTog
QWRkL3JlbW92ZSBPQSBjb25maWcgcGVyZiBvcHMNCj4gICBkcm0veGUvb2EvdWFwaTogRGVmaW5l
IGFuZCBwYXJzZSBPQSBzdHJlYW0gcHJvcGVydGllcw0KPiAgIGRybS94ZS9vYTogT0Egc3RyZWFt
IGluaXRpYWxpemF0aW9uIChPQUcpDQo+ICAgZHJtL3hlL29hL3VhcGk6IEV4cG9zZSBPQSBzdHJl
YW0gZmQNCj4gICBkcm0veGUvb2EvdWFwaTogUmVhZCBmaWxlX29wZXJhdGlvbg0KPiAgIGRybS94
ZS9vYTogQWRkIE9BUiBzdXBwb3J0DQo+ICAgZHJtL3hlL29hOiBBZGQgT0FDIHN1cHBvcnQNCj4g
ICBkcm0veGUvb2EvdWFwaTogUXVlcnkgT0EgdW5pdCBwcm9wZXJ0aWVzDQo+ICAgZHJtL3hlL29h
L3VhcGk6IE9BIGJ1ZmZlciBtbWFwDQo+ICAgZHJtL3hlL29hOiBBZGQgTU1JTyB0cmlnZ2VyIHN1
cHBvcnQNCj4gICBkcm0veGUvb2E6IE92ZXJyaWRlIEd1QyBSQyB3aXRoIE9BIG9uIFBWQw0KPiAg
IGRybS94ZS9vYTogQ2hhbmdlcyB0byBPQV9UQUtFTg0KPiAgIGRybS94ZS9vYTogRW5hYmxlIFhl
Misgb3ZlcnJ1biBtb2RlDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgIHwgICAgMiArDQo+ICAuLi4vZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVf
bWlfY29tbWFuZHMuaCAgfCAgICAzICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2Vu
Z2luZV9yZWdzLmggICAgICB8ICAgIDQgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hl
X2d0X3JlZ3MuaCAgICAgICAgICB8ICAgIDMgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3Mv
eGVfb2FfcmVncy5oICAgICAgICAgIHwgICA5OSArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGV2aWNlLmMgICAgICAgICAgICAgICAgfCAgIDE4ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlX3R5cGVzLmggICAgICAgICAgfCAgICA0ICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndF90eXBlcy5oICAgICAgICAgICAgICB8ICAgIDQgKw0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19wYy5jICAgICAgICAgICAgICAgIHwgICA1NiArDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX3BjLmggICAgICAgICAgICAgICAgfCAgICAzICsNCj4gIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9od19lbmdpbmVfdHlwZXMuaCAgICAgICB8ICAgIDIgKw0KPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2xyYy5jICAgICAgICAgICAgICAgICAgIHwgICAxMSArLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2xyYy5oICAgICAgICAgICAgICAgICAgIHwgICAgMSArDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmMgICAgICAgICAgICAgICAgfCAgICA2ICsNCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5jICAgICAgICAgICAgICAgICAgICB8IDIzMzQgKysrKysr
KysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5oICAgICAgICAgICAgICAg
ICAgICB8ICAgMzAgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX29hX3R5cGVzLmggICAgICAg
ICAgICAgIHwgIDIyOSArKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BlcmYuYyAgICAgICAg
ICAgICAgICAgIHwgICA2NyArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGVyZi5oICAgICAg
ICAgICAgICAgICAgfCAgIDIwICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jICAg
ICAgICAgICAgICAgICB8ICAgNzcgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3JlZ193aGl0
ZWxpc3QuYyAgICAgICAgIHwgICAyNCArLQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAg
ICAgICAgICAgICAgICAgICAgIHwgIDI4NiArKw0KPiAgMjIgZmlsZXMgY2hhbmdlZCwgMzI3NSBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS94ZS9yZWdzL3hlX29hX3JlZ3MuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX29hLmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfb2FfdHlwZXMuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9wZXJmLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVf
cGVyZi5oDQo+IA0KDQo=

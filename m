Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA31C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 15:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0117610E05F;
	Thu, 30 Jan 2025 15:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msE1WBPn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F1410E05F
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 15:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738250355; x=1769786355;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DalgNWt1loXFIBefGgTUkgN/2h+cpwl7S1mfeAHqXLQ=;
 b=msE1WBPnnG15o9qfw0txw3naTN96Gm7O6rqWqqo8q7pQH2S1UeHBSG6K
 xXc8/6o9+r/kihgElJbT+ou2raEVC3cY7AbqMOdzQkCE3txw/yY252xIA
 63Xt0zYdtSYLUFCGGOMirQq6XemJpjygVIEDBPyrA5ky558c/N2jqYnw/
 EWXDIxSkrFi1AgVWH7XEAi2YIoCpXASrjDUnycLAZVgEuo8EKhWhcLtFx
 vEgAufeQ1j7fzhSuIRKsXRxahFvY20tWGWI73ghRj6Azs2yzdxiDT7r1Q
 EM/NUVIav+JHOcoaiek2JhHE0JhQzQCzuBJv6/A0WJMBSYnE5y8j6eW2f w==;
X-CSE-ConnectionGUID: zpSWCxlSTvOsCWYm3n6EGA==
X-CSE-MsgGUID: MAABz3x2SYybz+0+z6oCvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38700294"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="38700294"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 07:19:15 -0800
X-CSE-ConnectionGUID: emdMz3+2RDeDPr4Yp+7pUA==
X-CSE-MsgGUID: 0wy1LjqZQbmdemR6jkrK4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113965716"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 07:19:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 07:19:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 07:19:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 07:19:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StVTohogJaWJ9M1XX/3C0mEajK0uVI8nTZDF6vQeg4X+fJu7KPVrU6+caMIxcCTWc2oCXVfADOzKFFQ/nWFy/hktDoXups8Uk8+GupcqsnYTJ6TiENDsUnuMZ9eaMvXYwOBX2C/fKMPgvVR39DGe6zOwc/CaQbPXEO/c4ldgyNAxkpuhihr/DkkUNzxyQWiZ/4sO0YqJ7X1jAXI4RET1z2BSDZVBBU3LT1CvN14ekXbwMb1KcQQhG2kkIHsTmkHubzjKrgUjAAQgUawZaviwCT+EpgEfgbExZDTGIgj9ZJpvXu6R+8On3KOnkZeOP45nEI4TMwRL9Vn/gBIIEfmfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DalgNWt1loXFIBefGgTUkgN/2h+cpwl7S1mfeAHqXLQ=;
 b=LUP4bEfq6tqc10NrHdRQl+e5UwCEjnrRPNC9tNzMRy8YCHI8KmTPgjJ58S6xilI62w8nfMcWbQgwL4GPJmYzrbBc14OCqpHQCI973xnIv7PdTqAJ702QDjznnriWZypk53OuP2gvtoeLMSTvPSS52FaR9qvkOCA4oP7XqtKsqG+6PHEwOM2J0VZPragniKgarZdVgyMzHANKd1Y8B/XynxwUg9dHhZ20aGVXfjWU0Q7lB9/BhNLEo23FTCSgrCO4mx+BlkXrrGBJK8/H+frF7cMo+VqyzXdNpyybKPQ+gbliAQrYeiBjul8PWCieIhLoq78WnmWGjNXkEi9XobIyfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 by DS7PR11MB7907.namprd11.prod.outlook.com (2603:10b6:8:db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 15:18:56 +0000
Received: from MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf]) by MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf%7]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 15:18:56 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>
Subject: RE: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
Thread-Topic: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
Thread-Index: AQHbcdDwWsXYR1fC1E6Ijdb1YBQM2rMs0nOAgAFkXtCAAFRYgIAAdXAAgABv6jA=
Date: Thu, 30 Jan 2025 15:18:55 +0000
Message-ID: <MN2PR11MB47287C0BFE414C72DEE4815092E92@MN2PR11MB4728.namprd11.prod.outlook.com>
References: <20250128222145.3849874-1-oak.zeng@intel.com>
 <20250128222145.3849874-2-oak.zeng@intel.com>
 <Z5ll8YZidnxz9Pp6@lstrano-desk.jf.intel.com>
 <MN2PR11MB47285CC53C87B37B279D7C4092EE2@MN2PR11MB4728.namprd11.prod.outlook.com>
 <Z5rXo41N+OmJaN9Q@lstrano-desk.jf.intel.com>
 <fbf07f6f921f018ea842dfae60bbcc6f7a4bd2ad.camel@linux.intel.com>
In-Reply-To: <fbf07f6f921f018ea842dfae60bbcc6f7a4bd2ad.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4728:EE_|DS7PR11MB7907:EE_
x-ms-office365-filtering-correlation-id: 8bdb3577-fa2d-42ef-044b-08dd414169ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?M2JSUHhkcmk2Sm1QdHhmK1NjS00xUVFzMnFwNXRJSmdJT3VWQzlORS9IMEUy?=
 =?utf-8?B?V3pWemVRZ1pqb1VaR0ZjdUk3dWRuRUZFK1kwZlJqc3hNZllrSVpKVnVnMk1G?=
 =?utf-8?B?d2oxT1NwcGJ5S0Y0VmJSdk1mWGEySS9PcmtNbUNOUXhPeE91RGdyZEJieGVI?=
 =?utf-8?B?UWZwMnJvSTJOaFcrV25TT3VzNC81R1Rock5WaUFHYTA4U1lYaXNVZktzOEhZ?=
 =?utf-8?B?bzVKQUZUME53VzRHK2NLUnRUc1JaNXVlUlkxT3RCSDE5azlUeVBNYmJ3ZmhU?=
 =?utf-8?B?M2R3QTF5dWlMTlVuM3U1Z290alZ3cjI3TTRxdk8zNk00S3dQUXRSUGFtSE9I?=
 =?utf-8?B?RnZkeHY4MXlsTTcrUXVjcTlZczBqeXlzeGFMeDh3MUJzckZKOHRuUU8reW1n?=
 =?utf-8?B?Y3Y3M09EOXB5eHpGNEE3bVZzYmVKUDg2cmVwd2plcDVQNXphT2xwT2FGMEF6?=
 =?utf-8?B?MlJLTjFMSDd0Ty96bW1kT0pONEw0MkFvSHlIZ1IvSjRiSXFqNGNiQlBpWjNS?=
 =?utf-8?B?TWRCSW50eGdjM21BMXdhcm1ldzlEM0VVdU9YTDM0TVFqSFdnTU1CbzRBZmV0?=
 =?utf-8?B?T0Y2em1XeVozcUtyemdRR2JVNjFwamtDSzhCNjhKdlo1b05HU3NlOUpuZXdN?=
 =?utf-8?B?d09ZWnJEZk51anZmUGtKREc5Vlh3cU5qVVZud0VaVmZmNGo2anN4WXlDMHRF?=
 =?utf-8?B?SVNCN0Z5RWhnbUVNdE9nZ3pEWnhDOVloTXRuZFJ4QnM1R1pwTUtidlBKTHBV?=
 =?utf-8?B?Y1pFZUNjTFZLV1MwYktEcGJmSVkyVnE5Y202SDhPbEExWHM3RmxMRFAzbnRG?=
 =?utf-8?B?V2lXN3cyMWpEUDkvd20vaDlRMEh3UnhiRG1JaDU4OXpkb0xqd1U2OWNsYVhQ?=
 =?utf-8?B?SVlVdGNoOVM0MitGcVU5UXA2cHJlUnJtY0s5RnVha2RwQmQvd1VTR05HYm9q?=
 =?utf-8?B?cEd3K3ZYU3JkUWQ5dTlXaEJXMVZLMUNXaU4vbUVMZklGYjVDTEM3bnJiQlNS?=
 =?utf-8?B?bjVkeEJ0eWdseXFJVGpMYlVBVUdSN2NFck1GTlRLb0JFbllKeDJXZXd5b2g1?=
 =?utf-8?B?aDdGcnNhOXU5Uzc0cnhwZ3FGUVlqb3lYclVoS3ZPMmZHS2x3VzFpczZnejRm?=
 =?utf-8?B?OHJHRjFTcDNhSjczMjNUbHluNW11NmlZL3gzU1picXZ0VVkwaXYvYUlQSVhG?=
 =?utf-8?B?SGVKRWZIQ3lXenFSZEg1dDNTNFcrSjlnb0JaQVVtSFBKNUpyVVhreEozaDJI?=
 =?utf-8?B?K09sQmd6WWNOY2VSb2R3dFZ2TlRlUDdEc25HcElzckozQ1JJZzh5SS9rMTVF?=
 =?utf-8?B?cm9YSUVaOEJUVlJLampYNDBqL2I5bmlPNTV5OFhPRHdnbUxvOWJ0ZXB2Wk1z?=
 =?utf-8?B?ME02b3NWdXdHb0FpY0RnWW91MWNCcDFNMzhUN1pXNVlxT3BNaUlvN2FNZU1N?=
 =?utf-8?B?eEJFQVFzZkFDL3AwQTgyNjJmaVpvK3JJNmlnamZhNCtVY1NWNE5FZXZqeXJ0?=
 =?utf-8?B?YVY5S21ZbzFCTlFlZm1pYVpGbmljNjNiVlJFMUhDQWZnRWl2TmFMaVYyd2NS?=
 =?utf-8?B?eHcvYnZ0NE0vMVBmVHpXa1VGYVlYbFNBcWtNdkg0STBwQkx3M0JOZ0gzamZu?=
 =?utf-8?B?Mk9yWnVzUFc1c0lsN3NlZUQ0YmQwQS9FRStVdjZYbktZODF5MnpoZFFNeFg0?=
 =?utf-8?B?aCt5MVkwSUFXL1FTclM1M09kTEx2RUpuMkd0UUZpNldTUVhXRXNiOVFiNndM?=
 =?utf-8?B?TU1ldzJKQURVNmd2dWx2QzFuT0ZDazBGVjlOejNSUDZ3RWZ1S2k5OVZPdWZH?=
 =?utf-8?B?SVYzU1VhazJFMG04bEpmV0l6QzJIQ085NUlxUlVmdmJCU2NhQkJVLzd6b3JY?=
 =?utf-8?B?TkNzQWhoaXc3RmRmUU0zeWJlek9sZmRBZGZlV0dFeFpvTVl4aFB3SnNrOUFz?=
 =?utf-8?Q?Uo0VvvOJFxKZqsWiJsagWVeZpz/L6dRM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmJUeWNCTWZIRjlIcWZNd3BoL0xSWEdQK2lDRStFbVJiMGNLOWN4SVBKc2lZ?=
 =?utf-8?B?NnNNelZhcmlGNlh3SmVsM2ZUWFF2MllsUlU0RmZ4YkZHdG9GaFZKc1FtYW5v?=
 =?utf-8?B?WjM2S29tVnlHVXBBNXBoR2ZMU3dtQk1JbGNsR01CVTVwc2MrNngzUDdlWE9r?=
 =?utf-8?B?WklodHRVcHFXRWxFUW4ycDZpOXoyTVl1NGROT3NxYllXb1FvNnExbWNxVE1T?=
 =?utf-8?B?dUNaM3h0R3lKWmQ1TFlMZjg2ZGJicVN6YWtIZUNRaFFIWWpkTlJnK2IyUUFl?=
 =?utf-8?B?aWxzYzJyek15WUdQdTM1ZHhtbTg1M2tJb2ljZzRHb0Z3WmFqZ3ZBVVJYRE5N?=
 =?utf-8?B?aVdKeTdod3NWeE5sQkN6Z2MrUkVDNzU4VmJkWXFhc2JlMkd0WWMyVXlHRVZL?=
 =?utf-8?B?V3d0MUt6M3N0S2doMEhGZVFmOXZWdzNXeEE0QXpZajZRVExuUzZHM1QzcmRs?=
 =?utf-8?B?a3QrVDFPbFUydlRBMkVmSmFmNmJFaVBET3hzU0F4M1NrZ2VHdWlOQnBFMll5?=
 =?utf-8?B?ektBVXNsRS9MM0VaWlB5bEhldHkvWG9CNUJkbTFMckdWTENQeUFnaE5rbThl?=
 =?utf-8?B?aWVqekdtdGVzRHVNS2NRSWR0UldIcjBka1BFOWkxNXlyd00xVmdSRGVFNzFG?=
 =?utf-8?B?blRxOVo2YkR2YjZzUmV3UzhEOTBBUzNvblFNaVc3N0lmakFSajdqRWFTdS9L?=
 =?utf-8?B?Vm1xb0hYYWN4VTZpckExMDFsa0VhVExUa2pYa1RSZnFHSmhwZkZlaEFIVzBr?=
 =?utf-8?B?TktnNG9PS0JGK2M5R3dHRHFNWGdvZDZ0Vzlib1FwWHV0VDl5ZTBMZ0podDE4?=
 =?utf-8?B?UkRKcldiZCtCSEpxWXd4c1I4ek9Rb3puNTZxMGY3dml3K1Y4Y2R4cFE4Nzlx?=
 =?utf-8?B?KzN0KzYwOUpPaUFJbDZDOFR1S2k3SmFUQmtHRHlXOVQ4ajk3Y1o4MHNTWkZy?=
 =?utf-8?B?TURJdTJZeFl4L1p4RW40b2crZVZWRUh4bDduNVhVZDZVK3ZpNjBiWHRTYXUw?=
 =?utf-8?B?L0E5SjRQR1NGbllhUGRKYXRqVDhGTUpFU0dUQjZ2cXZ5MVNLWnNlUVg5cnNX?=
 =?utf-8?B?WlBicFIzQWt1dTk1MWJyZ0R6RDJnRk83cFJTQXMyeDY1cmdFUVBtR0t0ak04?=
 =?utf-8?B?Rkk4NFBEa2ZNQ1FQQnJ1eVJsMS9YQWlvY2hxelFuTXFGbklVYkQ4aUp6VkU0?=
 =?utf-8?B?VlFueC9lSm1PQy94SVllRnNPNzBMZFF0bWhpTE8wVU05dldhWnZzb1F4cHBh?=
 =?utf-8?B?TUhSOTZWM05YWjFHeGJ2VHF0R0NSbTE3VUtDbkdyMkpqS09zSi9nNml1WVJ6?=
 =?utf-8?B?ckhYVlh2OVFkd0paRlEwcmRnVlpYSXV5cWdLZFBSWW1QckozSUJlQ01GUUhm?=
 =?utf-8?B?MGRWemVNWGJGZmNtMldBSkZvRjRlMHpYR1l3VGlCbHRTNkQ5d08vdE5tV3Ru?=
 =?utf-8?B?bzdVT3puZnEzREJRRjh3K3pMVWFNeTlHTGVhRHowZTdwTDY5NGtRMVdrMzNr?=
 =?utf-8?B?V2lFNDdzTFpEcXRTU2JuYS9hdUdxdHBidXNjK2RnSmRYSjAxUGt2QmtJSkV0?=
 =?utf-8?B?WW55bzQ4RWZPMU14NWtlREFQeXpraENmSnJDdC9ubEh4VTY2WnR5R2xRV3RU?=
 =?utf-8?B?akVBWmI5MG5kaUxqZ29SQmN0TVpjMkI0b0wrSGlTbktkcVVFazhUd1QxazBu?=
 =?utf-8?B?N0R4d1lKT1lZaUpQbTVJWXRHTzcvVW1jVXVJcGNBUW5HcmpQREZJVWJKdGZO?=
 =?utf-8?B?M0llUnZUb0dnQTZ4d2lWMXh5L1hGZ1R2UC9YRnhtRVdUU0F2TUUxUU80dytP?=
 =?utf-8?B?VEp3Y1NiS09obkhpejAwNjNLaHRZRU92Wm1qd2sraTZtbXVKd1FqMXROT1p1?=
 =?utf-8?B?TmlES01IVDVjSElaK1RDdWlZVXFYK0pLeWRza0N3MnN5U1hkSEtXb2ZMSkRI?=
 =?utf-8?B?dHVndWc2QUk3bjkxL3VidlhKdUJtMlpFWWJyR3FoTkFNcE1xdEFnMlFHcFhK?=
 =?utf-8?B?YVZRUVlqQlpEUGYzR3dOOHJuRVUxY0xpakR2ODUxNm1PM0ZTZUVRbHJRZmR4?=
 =?utf-8?B?RlI0ZnBTTWgrWnlwWVZxbXgrYnIwNjd1eHpxYkxxTllIQVdWRXJBVnB2TjNM?=
 =?utf-8?Q?5DkQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdb3577-fa2d-42ef-044b-08dd414169ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 15:18:55.9675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kJt+yF5FEj7+G4WRwW4VdBcEpG4mluyOIkLAjYAcZycSNofwbfbmzlIALlWKl7gmLFzxYxncE/5HpGFDNIb4JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7907
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBKYW51YXJ5IDMw
LCAyMDI1IDM6MzcgQU0NCj4gVG86IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVs
LmNvbT47IFplbmcsIE9haw0KPiA8b2FrLnplbmdAaW50ZWwuY29tPg0KPiBDYzogaW50ZWwteGVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8zXSBkcm0veGU6IENsZWFyIHNjcmF0Y2ggcGFnZSBiZWZv
cmUgdm1fYmluZA0KPiANCj4gT24gV2VkLCAyMDI1LTAxLTI5IGF0IDE3OjM2IC0wODAwLCBNYXR0
aGV3IEJyb3N0IHdyb3RlOg0KPiA+IE9uIFdlZCwgSmFuIDI5LCAyMDI1IGF0IDAyOjAxOjM4UE0g
LTA3MDAsIFplbmcsIE9hayB3cm90ZToNCj4gPiA+DQo+ID4gPg0KPiA+ID4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiBGcm9tOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+DQo+ID4gPiA+IFNlbnQ6IEphbnVhcnkgMjgsIDIwMjUgNjoxOSBQTQ0K
PiA+ID4gPiBUbzogWmVuZywgT2FrIDxvYWsuemVuZ0BpbnRlbC5jb20+DQo+ID4gPiA+IENjOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+ID4gPiA+IGpvb25hcy5sYWh0aW5lbkBs
aW51eC5pbnRlbC5jb207DQo+ID4gPiA+IFRob21hcy5IZWxsc3Ryb21AbGludXguaW50ZWwuY29t
DQo+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8zXSBkcm0veGU6IENsZWFyIHNjcmF0Y2gg
cGFnZSBiZWZvcmUNCj4gPiA+ID4gdm1fYmluZA0KPiA+ID4gPg0KPiA+ID4gPiBPbiBUdWUsIEph
biAyOCwgMjAyNSBhdCAwNToyMTo0NFBNIC0wNTAwLCBPYWsgWmVuZyB3cm90ZToNCj4gPiA+ID4g
PiBXaGVuIGEgdm0gcnVucyB1bmRlciBmYXVsdCBtb2RlLCBpZiBzY3JhdGNoIHBhZ2UgaXMgZW5h
YmxlZCwNCj4gd2UNCj4gPiA+ID4gbmVlZA0KPiA+ID4gPiA+IHRvIGNsZWFyIHRoZSBzY3JhdGNo
IHBhZ2UgbWFwcGluZyBiZWZvcmUgdm1fYmluZCBmb3IgdGhlDQo+ID4gPiA+ID4gdm1fYmluZA0K
PiA+ID4gPiA+IGFkZHJlc3MgcmFuZ2UuIFVuZGVyIGZhdWx0IG1vZGUsIHdlIGRlcGVuZCBvbiBy
ZWNvdmVyYWJsZQ0KPiBwYWdlDQo+ID4gPiA+IGZhdWx0DQo+ID4gPiA+ID4gdG8gZXN0YWJsaXNo
IG1hcHBpbmcgaW4gcGFnZSB0YWJsZS4gSWYgc2NyYXRjaCBwYWdlIGlzIG5vdA0KPiA+ID4gPiA+
IGNsZWFyZWQsDQo+ID4gPiA+ID4gR1BVIGFjY2VzcyBvZiBhZGRyZXNzIHdvbid0IGNhdXNlIHBh
Z2UgZmF1bHQgYmVjYXVzZSBpdA0KPiBhbHdheXMNCj4gPiA+ID4gPiBoaXRzDQo+ID4gPiA+ID4g
dGhlIGV4aXN0aW5nIHNjcmF0Y2ggcGFnZSBtYXBwaW5nLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
V2hlbiB2bV9iaW5kIHdpdGggSU1NRURJQVRFIGZsYWcsIHRoZXJlIGlzIG5vIG5lZWQgb2YNCj4g
Y2xlYXJpbmcNCj4gPiA+ID4gPiBhcw0KPiA+ID4gPiA+IGltbWVkaWF0ZSBiaW5kIGNhbiBvdmVy
d3JpdGUgdGhlIHNjcmF0Y2ggcGFnZSBtYXBwaW5nLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU28g
ZmFyIG9ubHkgaXMgeGUyIGFuZCB4ZTMgcHJvZHVjdHMgYXJlIGFsbG93ZWQgdG8gZW5hYmxlDQo+
ID4gPiA+ID4gc2NyYXRjaA0KPiA+ID4gPiBwYWdlDQo+ID4gPiA+ID4gdW5kZXIgZmF1bHQgbW9k
ZS4gT24gb3RoZXIgcGxhdGZvcm0gd2UgZG9uJ3QgYWxsb3cgc2NyYXRjaA0KPiBwYWdlDQo+ID4g
PiA+IHVuZGVyDQo+ID4gPiA+ID4gZmF1bHQgbW9kZSwgc28gbm8gbmVlZCBvZiBzdWNoIGNsZWFy
aW5nLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPG9hay56
ZW5nQGludGVsLmNvbT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV92bS5jIHwgMzINCj4gPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4gPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspDQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4g
PiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+ID4gPiA+IGluZGV4IDY5MDMz
MDM1MmQ0Yy4uMTk2ZDM0N2M2YWMwIDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV92bS5jDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
LmMNCj4gPiA+ID4gPiBAQCAtMzgsNiArMzgsNyBAQA0KPiA+ID4gPiA+IMKgI2luY2x1ZGUgInhl
X3RyYWNlX2JvLmgiDQo+ID4gPiA+ID4gwqAjaW5jbHVkZSAieGVfd2EuaCINCj4gPiA+ID4gPiDC
oCNpbmNsdWRlICJ4ZV9obW0uaCINCj4gPiA+ID4gPiArI2luY2x1ZGUgImk5MTVfZHJ2LmgiDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiDCoHN0YXRpYyBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnhlX3Zt
X29iaihzdHJ1Y3QgeGVfdm0gKnZtKQ0KPiA+ID4gPiA+IMKgew0KPiA+ID4gPiA+IEBAIC0yOTE3
LDYgKzI5MTgsMzQgQEAgc3RhdGljIGludA0KPiA+ID4gPiB4ZV92bV9iaW5kX2lvY3RsX3ZhbGlk
YXRlX2JvKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QNCj4geGVfYm8NCj4gPiA+ID4gKmJv
LA0KPiA+ID4gPiA+IMKgCXJldHVybiAwOw0KPiA+ID4gPiA+IMKgfQ0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gK3N0YXRpYyBib29sIF9feGVfdm1fbmVlZHNfY2xlYXJfc2NyYXRjaF9wYWdlcyhzdHJ1
Y3QNCj4geGVfZGV2aWNlDQo+ID4gPiA+ICp4ZSwNCj4gPiA+ID4gPiArCQkJCQnCoMKgwqDCoMKg
IHN0cnVjdCB4ZV92bQ0KPiA+ID4gPiA+ICp2bSwgdTMyDQo+ID4gPiA+IGJpbmRfZmxhZ3MpDQo+
ID4gPiA+ID4gK3sNCj4gPiA+ID4gPiArCWlmICgheGVfdm1faW5fZmF1bHRfbW9kZSh2bSkpDQo+
ID4gPiA+ID4gKwkJcmV0dXJuIGZhbHNlOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArCWlmICgh
eGVfdm1faGFzX3NjcmF0Y2godm0pKQ0KPiA+ID4gPiA+ICsJCXJldHVybiBmYWxzZTsNCj4gPiA+
ID4gPiArDQo+ID4gPiA+ID4gKwlpZiAoYmluZF9mbGFncyAmDQo+IERSTV9YRV9WTV9CSU5EX0ZM
QUdfSU1NRURJQVRFKQ0KPiA+ID4gPiA+ICsJCXJldHVybiBmYWxzZTsNCj4gPiA+ID4gPiArDQo+
ID4gPiA+ID4gKwlpZiAoIShJU19MVU5BUkxBS0UoeGUpIHx8IElTX0JBVFRMRU1BR0UoeGUpIHx8
DQo+ID4gPiA+IElTX1BBTlRIRVJMQUtFKHhlKSkpDQo+ID4gPiA+ID4gKwkJcmV0dXJuIGZhbHNl
Ow0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArCXJldHVybiB0cnVlOw0KPiA+ID4gPiA+ICt9DQo+
ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICtzdGF0aWMgdm9pZCBfX3hlX3ZtX2NsZWFyX3NjcmF0Y2hf
cGFnZXMoc3RydWN0IHhlX2RldmljZQ0KPiAqeGUsDQo+ID4gPiA+IHN0cnVjdCB4ZV92bSAqdm0s
DQo+ID4gPiA+ID4gKwkJCQkJdTY0IHN0YXJ0LCB1NjQgZW5kKQ0KPiA+ID4gPiA+ICt7DQo+ID4g
PiA+ID4gKwlzdHJ1Y3QgeGVfdGlsZSAqdGlsZTsNCj4gPiA+ID4gPiArCXU4IGlkOw0KPiA+ID4g
PiA+ICsNCj4gPiA+ID4gPiArCWZvcl9lYWNoX3RpbGUodGlsZSwgeGUsIGlkKQ0KPiA+ID4gPiA+
ICsJCXhlX3B0X3phcF9yYW5nZSh0aWxlLCB2bSwgc3RhcnQsIGVuZCk7DQo+ID4gPiA+ID4gK30N
Cj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gwqBpbnQgeGVfdm1fYmluZF9pb2N0bChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPiA+ID4gPiA+IHN0cnVjdA0KPiA+ID4gPiBkcm1f
ZmlsZSAqZmlsZSkNCj4gPiA+ID4gPiDCoHsNCj4gPiA+ID4gPiDCoAlzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSA9IHRvX3hlX2RldmljZShkZXYpOw0KPiA+ID4gPiA+IEBAIC0zMDYyLDYgKzMwOTEsOSBA
QCBpbnQgeGVfdm1fYmluZF9pb2N0bChzdHJ1Y3QNCj4gZHJtX2RldmljZQ0KPiA+ID4gPiAqZGV2
LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpDQo+ID4gPiA+ID4gwqAJCXUzMiBw
cmVmZXRjaF9yZWdpb24gPQ0KPiA+ID4gPiBiaW5kX29wc1tpXS5wcmVmZXRjaF9tZW1fcmVnaW9u
X2luc3RhbmNlOw0KPiA+ID4gPiA+IMKgCQl1MTYgcGF0X2luZGV4ID0gYmluZF9vcHNbaV0ucGF0
X2luZGV4Ow0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gKwkJaWYgKF9feGVfdm1fbmVlZHNfY2xlYXJf
c2NyYXRjaF9wYWdlcyh4ZSwNCj4gdm0sDQo+ID4gPiA+IGZsYWdzKSkNCj4gPiA+ID4gPiArCQkJ
X194ZV92bV9jbGVhcl9zY3JhdGNoX3BhZ2VzKHhlLA0KPiB2bSwNCj4gPiA+ID4gPiBhZGRyLA0K
PiA+ID4gPiBhZGRyICsgcmFuZ2UpOw0KPiA+ID4gPg0KPiA+ID4gPiBBIGZldyB0aGluZ3MuLi4N
Cj4gPiA+ID4NCj4gPiA+ID4gLSBJIGJlbGlldmUgdGhpcyBpcyBvbmx5IG5lZWRlZCBmb3IgYmlu
ZCB1c2VyIG9wZXJhdGlvbnMgb3INCj4gPiA+ID4gaW50ZXJuYWwgTUFQDQo+ID4gPiA+IMKgIEdQ
VSBWTUEgb3BlcmF0aW9ucy4NCj4gPiA+DQo+ID4gPiBEaWQgeW91IG1lYW4gdGhpcyBpcyBvbmx5
IG5lZWRlZCBmb3IgdXNlciBiaW5kLCBidXQgbm90IGZvcg0KPiA+ID4gaW50ZXJuYWwgbWFwPw0K
PiA+ID4NCj4gPg0KPiA+IE5lZWRlZCBmb3IgdXNlciBiaW5kIGFuZCBhbHNvIGZvciBpbnRlcm5h
bCBNQVAuIFdpdGggdXBkYXRpbmcgdGhlDQo+ID4gYmluZA0KPiA+IHBpcGVsaW5lIHlvdSB3aWxs
IG9ubHkgY2FyZSBNQVAgb3BzLg0KPiA+DQo+ID4gPiA+IC0gSSBiZWxpZXZlIGEgVExCIGludmFs
aWRhdGlvbiB3aWxsIGJlIHJlcXVpcmVkLg0KPiA+ID4NCj4gPiA+IE15IHVuZGVyc3RhbmRpbmcg
aXMsIE5VTEwgcHRlIHdvbid0IGJlIGNhY2hlZCBpbiBUTEIsIHNvIFRMQg0KPiA+ID4gaW52YWxp
ZGF0aW9uIGlzIG5vdCBuZWVkZWQuDQo+ID4gPg0KPiA+DQo+ID4gSSB3b3VsZCB0aGluayBOVUxM
IHB0ZXMgYXJlIGNhY2hlZCBidXQgbm90IGNlcnRhaW4gZWl0aGVyIHdheS4NCj4gDQo+IE5vdGUg
dGhhdCBhIE5VTEwgLyBzY3JhdGNoIG1hcHBpbmcgZm9yIGxhcmdlciBwYWdlcyBtYXkgcG9pbnQg
dG8gYQ0KPiBwaHlzaWNhbCBwYWdlLg0KDQpUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBM
b29raW5nIGF0IHBhZ2UgdGFibGUgZGVmaW5pdGlvbiwgc29tZSBoaWdoDQpMZXZlbCBwYWdlIHRh
YmxlIGluZGVlZCBkb2Vzbid0IHN1cHBvcnQgTlVMTCBlbnRyeS4NCg0KU28geWVzIFRMQiBpbnZh
bGlkYXRpb24gaXMgcmVxdWlyZWQuDQoNCk9haw0KDQo+IA0KPiAvVGhvbWFzDQo+IA0KPiANCj4g
Pg0KPiA+ID4gPiAtIEkgZG9uJ3QgdGhpbmsgY2FsbGluZyB6YXAgUFRFcyByYW5nZSB3b3JrcyBo
ZXJlLCBnaXZlbiBob3cgdGhlDQo+ID4gPiA+IHNjcmF0Y2gNCj4gPiA+ID4gwqAgdGFibGVzIGFy
ZSBzZXQgdXAgKGkuZS4sIG5ldyBQVEVzIG5lZWQgdG8gYmUgY3JlYXRlZCBwb2ludGluZw0KPiA+
ID4gPiB0byBhbg0KPiA+ID4gPiDCoCBpbnZhbGlkIHN0YXRlKS4NCj4gPiA+DQo+ID4gPiBZb3Ug
YXJlIHJpZ2h0Lg0KPiA+ID4NCj4gPiA+IEkgZGlkbid0IHJlYWxpemUgdGhhdCB1c2luZyB4ZV9w
dF93YWxrX3NoYXJlZCB0byB3YWxrIGFuZCB6YXAgUFRFcw0KPiA+ID4gaGFzIGEgbGltaXRhdGlv
bjoNCj4gPiA+IEZvciB0aGUgdmlydHVhbCBhZGRyZXNzIHJhbmdlIHdlIHdhbnQgdG8gemFwLCBh
bGwgdGhlIHBhZ2UgdGFibGVzDQo+ID4gPiBoYXMgdG8gYmUgYWxyZWFkeQ0KPiA+ID4gZXhpc3Qu
IFRoaXMgaW50ZXJmYWNlIGRvZXNuJ3QgY3JlYXRlIG5ldyBwYWdlIHRhYmxlcy4gRXZlbiB0aG91
Z2gNCj4gPiA+IHhlX3B0X3dhbGtfc2hhcmVkDQo+ID4gPiB0YWtlcyBhIHJhbmdlIHBhcmFtZXRl
ciAoYWRkciwgZW5kKSwgcmFuZ2UgcGFyYW1ldGVyIGNhbid0IGJlDQo+ID4gPiBhcmJpdHJhcnku
DQo+ID4gPg0KPiA+ID4gVG9kYXkgb25seSBbeGVfdm1hX3N0YXJ0LCB4ZV92bWFfZW5kKSBpcyB1
c2VkIHRvIHNwZWNpZnkgdGhlDQo+ID4gPiB4ZV9wdF93YWxrX3NoYXJlZA0KPiA+ID4gV2Fsa2lu
ZyByYW5nZS4gQXJiaXRyYXJ5IHJhbmdlIHdvbid0IHdvcmsgYXMgeW91IHBvaW50ZWQgb3V0LiBU
bw0KPiBtZQ0KPiA+ID4gdGhpcyBpcyBhIHNtYWxsDQo+ID4gPiBJbnRlcmZhY2UgZGVzaWduIGlz
c3VlLiBJZiB5b3UgYWdyZWUsIEkgY2FuIHJlLXBhcmFtZXRlcml6ZQ0KPiA+ID4geGVfcHRfd2Fs
a19zaGFyZWQgdG8gdGFrZQ0KPiA+ID4gVk1BIHZzIGFkZHIvZW5kLiBUaGlzIHdheSBwZW9wbGUg
d29uJ3QgbWFrZSB0aGUgc2FtZSBtaXN0YWtlDQo+IGluIHRoZQ0KPiA+ID4gZnV0dXJlLg0KPiA+
ID4NCj4gPg0KPiA+IEFoLCBuby4gU1ZNIHdpbGwgdXNlIHJhbmdlcyBzbyBJIHRoaW5rIChhZGRy
LCBlbmQpIGFyZSB0aGUgcmlnaHQNCj4gPiBwYXJhbWV0ZXJzIGZvciBpbnRlcm5hbCBQVCBmdW5j
dGlvbnMuDQo+ID4NCj4gPiA+IEFueXdheSwgSSB3aWxsIGZvbGxvdyB0aGUgZGlyZWN0aW9uIHlv
dSBnaXZlIGJlbG93IHRvIHJld29yayB0aGlzDQo+ID4gPiBzZXJpZXMuDQo+ID4gPg0KPiA+DQo+
ID4gKzENCj4gPg0KPiA+IE1hdHQNCj4gPg0KPiA+ID4gT2FrDQo+ID4gPg0KPiA+ID4gPiAtIFRo
aXMgc2VyaWVzIGFwcGVhcnMgdG8gYmUgdW50ZXN0ZWQgYmFzZWQgb24gdGhlIHBvaW50cyBhYm92
ZS4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlcmVmb3JlLCBpbnN0ZWFkIG9mIHRoaXMgc2VyaWVzLCBJ
IGJlbGlldmUgeW91IHdpbGwgbmVlZCB0bw0KPiA+ID4gPiBmdWxseQ0KPiA+ID4gPiB1cGRhdGUg
dGhlIGJpbmQgcGlwZWxpbmUgdG8gcHJvY2VzcyBNQVAgR1BVIFZNQSBvcGVyYXRpb25zDQo+IGhl
cmUuDQo+ID4gPiA+DQo+ID4gPiA+IFNvIHJvdWdobHkuLi4NCj4gPiA+ID4NCj4gPiA+ID4gLSBN
YXliZSBpbmNsdWRlIGEgYml0IGluIHhlX3ZtYV9vcF9tYXAgdGhhdCBzcGVjaWZpZXMNCj4gImlu
dmFsaWRhdGUNCj4gPiA+ID4gb24NCj4gPiA+ID4gwqAgYmluZCwiIHNldCBpbiB2bV9iaW5kX2lv
Y3RsX29wc19jcmVhdGUsIHNpbmNlIHRoaXMgd2lsbCBuZWVkIHRvDQo+ID4gPiA+IGJlDQo+ID4g
PiA+IMKgIHdpcmVkIHRocm91Z2hvdXQgdGhlIGJpbmQgcGlwZWxpbmUuDQo+ID4gPiA+IC0gRG9u
J3QgdmFsaWRhdGUgYmFja2luZyBtZW1vcnkgaW4gdGhpcyBjYXNlLg0KPiA+ID4gPiAtIEVuc3Vy
ZSB0aGF0IHhlX3ZtYV9vcHNfaW5jcl9wdF91cGRhdGVfb3BzIGlzIGNhbGxlZCBpbiB0aGlzDQo+
ID4gPiA+IGNhc2UNCj4gPiA+ID4gZm9yDQo+ID4gPiA+IMKgIE1BUCBvcGVyYXRpb25zLCBmb3Jj
aW5nIGVudHJ5IGludG8gdGhlIHhlX3B0LmMgYmFja2VuZC4NCj4gPiA+ID4gLSBVcGRhdGUgeGVf
cHRfc3RhZ2VfYmluZF93YWxrIHdpdGggYSB2YXJpYWJsZSB0aGF0IGluZGljYXRlcw0KPiA+ID4g
PiBjbGVhcmluZw0KPiA+ID4gPiDCoCB0aGUgUFRFLiBJbnN0ZWFkIG9mIGNhbGxpbmcgcHRlX2Vu
Y29kZV92bWEgaW4NCj4gPiA+ID4geGVfcHRfc3RhZ2VfYmluZF9lbnRyeSwNCj4gPiA+ID4gwqAg
c2V0IHRoaXMgdmFyaWFibGUgZm9yIFBUIGJpbmQgb3BlcmF0aW9ucyBkZXJpdmVkIGZyb20gTUFQ
DQo+ID4gPiA+IG9wZXJhdGlvbnMNCj4gPiA+ID4gwqAgdGhhdCBtZWV0IHRoZSAiaW52YWxpZGF0
ZSBvbiBiaW5kIiBjb25kaXRpb24uDQo+ID4gPiA+IC0gRW5zdXJlIG5lZWRzX2ludmFsaWRhdGlv
biBpcyBzZXQgaW4gc3RydWN0DQo+ID4gPiA+IHhlX3ZtX3BndGFibGVfdXBkYXRlX29wcyBpZg0K
PiA+ID4gPiDCoCBhIE1BUCBvcGVyYXRpb24gaXMgaW5jbHVkZWQgdGhhdCBtZWV0cyB0aGUgImlu
dmFsaWRhdGUgb24gYmluZCINCj4gPiA+ID4gwqAgY29uZGl0aW9uLg0KPiA+ID4gPiAtIFNldCB0
aGUgVk1BIHRpbGVfaW52YWxpZGF0ZWQgaW4gYWRkaXRpb24gdG8gdGlsZV9wcmVzZW50IGZvcg0K
PiA+ID4gPiBNQVANCj4gPiA+ID4gwqAgb3BlcmF0aW9ucyB0aGF0IG1lZXQgdGhlICJpbnZhbGlk
YXRlIG9uIGJpbmQiIGNvbmRpdGlvbi4NCj4gPiA+ID4NCj4gPiA+ID4gSSBtaWdodCBiZSBtaXNz
aW5nIHNvbWUgaW1wbGVtZW50YXRpb24gZGV0YWlscyBtZW50aW9uZWQNCj4gYWJvdmUsDQo+ID4g
PiA+IGJ1dCB0aGlzDQo+ID4gPiA+IHNob3VsZCBwcm92aWRlIHlvdSB3aXRoIHNvbWUgZGlyZWN0
aW9uLg0KPiA+ID4gPg0KPiA+ID4gPiBMYXN0bHksIGFuZCBwZXJoYXBzIG1vc3QgaW1wb3J0YW50
bHksIHBsZWFzZSB0ZXN0IHRoaXMgdXNpbmcgYW4NCj4gPiA+ID4gSUdUDQo+ID4gPiA+IGFuZA0K
PiA+ID4gPiBpbmNsdWRlIHRoZSByZXN1bHRzIGluIHRoZSBuZXh0IHBvc3QuDQo+ID4gPiA+DQo+
ID4gPiA+IE1hdHQNCj4gPiA+ID4NCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gwqAJCW9wc1tpXSA9
IHZtX2JpbmRfaW9jdGxfb3BzX2NyZWF0ZSh2bSwgYm9zW2ldLA0KPiA+ID4gPiBvYmpfb2Zmc2V0
LA0KPiA+ID4gPiA+IMKgCQkJCQkJwqAgYWRkciwgcmFuZ2UsDQo+ID4gPiA+ID4gb3AsIGZsYWdz
LA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gcHJlZmV0Y2hfcmVnaW9uLA0KPiA+ID4gPiBwYXRfaW5k
ZXgpOw0KPiA+ID4gPiA+IC0tDQo+ID4gPiA+ID4gMi4yNi4zDQo+ID4gPiA+ID4NCg0K

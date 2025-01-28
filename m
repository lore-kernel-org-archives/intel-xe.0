Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18B5C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 18:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4990B10E043;
	Tue, 28 Jan 2025 18:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8F6RSq4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4BB10E043
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 18:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738087847; x=1769623847;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=i5OhC60LR51WRKphSug7j2D3LShfsxkCmD6yGnfMNnU=;
 b=d8F6RSq4EVMz+2znK1JizN67icoB7+Q0zQzGaIeR9bY7vsSbnh2Pvpp4
 N8hENBSvv6XCr/Ya2Iow32C6Wb45DMzPdnxt+hSMFd5kACLlUdNK6zVNI
 pQumjy+W0AJLSWXWpDLunWTOJuoOcH9qGy1GhplKLSR8fuZNFvDEBj6Ax
 pUrXXcQ99rOndmPzp73N7ut5Hxo5HRCecYkuOdp3csI/0MwuB5jF/7C7h
 Ih0GNvJW6SBDdXZqtR3VuMok6j7w4/uYNqxcwG/9eG8GAuL6rJ/m5Qjlo
 Yk3B5qcEIsGBXkygR+oPEtNnPCMZBMqk9AlkLzY6c2GI+edOm/hMoVH/Y w==;
X-CSE-ConnectionGUID: ZuN8r2sIQj2iwIuF/hksOA==
X-CSE-MsgGUID: cYyEyY7ySqu49PoEbEcLZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49078483"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="49078483"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 10:10:46 -0800
X-CSE-ConnectionGUID: AIUMFmHPTseCyzmNiPbjLg==
X-CSE-MsgGUID: vKYmgKFLShm742I+pZeHxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="109337667"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 10:10:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 10:10:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 10:10:44 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 10:10:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTtHp1r9/AXWdORhLXRpP46MRyGdfl0mwZk2UNdGkuWq+FsfgPtQbjZKJvNziE/rJxJu28Y/QP073+EFZmad4tDq3eKtshl9JywUe59Cq0ok/+4Xg9DGuhSnoAIUQ7IKeO4zQov1PZ1zBz44VBAL3x2g15DlX9IS2FNRjB2tOdcDxag7AJ2KCs/mWvmGkWjkURHvK/K9thGwcH66lRmRJz2FmLzywUC2rbQtW8V0aEDHLhxpFNVbr7lfdEUh1qoaq0Z7l5zLOcq5ugPZ1/RUURpoaAn0AzVczmoYNuHcJ8G5dJJMW252ZsY6sURsSMRTkSte9HHmbKz2WYQJ41pSRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5OhC60LR51WRKphSug7j2D3LShfsxkCmD6yGnfMNnU=;
 b=r21EiJtGoyHGC3GiOlEMSJIWl8dAYRbRgEIVcyfs5Kv3g2+UCBUXGxJppRGTBVhyIzwwtwYg4iD+UffRFtXce/3ddcYtIJFYhzNSjq5gda7gqfV0GJ2Zz0N8YU3lrpWOFAcAyMTc/zWyzlGYcfiLnFtBc/cfCkZzqmaVUN07uY8fXXBn9MWHQw/D4lgvUHXhvCyjhciZgDwiOOpfjIS8KM31JP0FwgOqAXj2VuvSjfDCdHZTisb/is58u2Rfx8weTXHYnJYscJhIe5QuMxqPSXQNSesVz81b7cfKY5KTCdqeF6xjdPco5w31oFVF0q0ZHufaf6Eg6yjjo37qM4OGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:167::22)
 by CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 18:10:28 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa%3]) with mapi id 15.20.8398.014; Tue, 28 Jan 2025
 18:10:28 +0000
From: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
Subject: Re: [PATCH v2] drm/xe/bmg: Add new PCI IDs
Thread-Topic: [PATCH v2] drm/xe/bmg: Add new PCI IDs
Thread-Index: AQHbcaChZCQS6HZFj0S4FFt+sL9v87MsfL4A
Date: Tue, 28 Jan 2025 18:10:28 +0000
Message-ID: <ae98891a157c59a05752035cfa119b0e501881fe.camel@intel.com>
References: <20250128162015.3288675-1-shekhar.chauhan@intel.com>
In-Reply-To: <20250128162015.3288675-1-shekhar.chauhan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5711:EE_|CO1PR11MB5154:EE_
x-ms-office365-filtering-correlation-id: 021408ca-2397-4324-aa28-08dd3fc70be7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Z2craGdNVzkzT3JLL2tEWUZZWmpxSUVDNUowRjFuUDhaNGVoRUNsS1FhK3dM?=
 =?utf-8?B?NTVBa2lCem9Hb2RRL2x6d2VraHltbnJMSjhGRXh2d0VsRVRZcW9ySDk1RGdB?=
 =?utf-8?B?OWJpOGdEU1ZTWitYNVdQdnhUa0czL0p5Rjl4L3AwUngyOHg3VllJb2xCZ3lI?=
 =?utf-8?B?NTJPRTgzQmI5eWRKbUd0bHVuMU9mVm9VTmdyWkZOYkVIanUyQzAzVmNaN0h1?=
 =?utf-8?B?MlRGMjJXQis1N0NBa0d0eFMwb0RSd0ZtSDlhL2RZSjR5STBMU0I0bGVzRlkx?=
 =?utf-8?B?N3BlTVVFSldxZ09aQWVMcmFITnR3QWVTRWlCS3lkRHdVVlRBNklwc0RuaWcx?=
 =?utf-8?B?SkQ4UFA5NTRkZW8wSExoZGF0NjRpdnNLL0IxcEZOa0lrMFozcTBNSW1IN3lV?=
 =?utf-8?B?NWM2aTRlUkJjbHJRcytUSkNGbUJzd3c1dlkxSjZDWXN1bkZ2c2lpOWlJK2Uz?=
 =?utf-8?B?TlJRVHFsd1B1ZDVHOStLa2Z3TThTUHA1ODNCb3ZmRGpCMUxGakJMTzNSVTNZ?=
 =?utf-8?B?bHQ4RW1UcE1tY1RLcDNiRnJ3Z0Y1cDE3VVhtWkdGWWJ0Y1g0dEFFL1B6YjJp?=
 =?utf-8?B?L3FGRWtQYkxSTEpFZTZMUStHUlpJSmhjaUhWdTYrWTYzalhBVGFhNlNuRFFJ?=
 =?utf-8?B?Zmo2eWh5MXBZRUgydDN4VWk3bWluUDhYTDZLc0IwOGdNcExBZ2YrUUhreXVY?=
 =?utf-8?B?Rm5xYlRBVTBRdklub3I4c2FueGpiZUwzUTE2NW1BZmQrTUNCKytlTUxDZmxz?=
 =?utf-8?B?L0xIckNrYjZEQ2JQajhWd3pyUytSbXo1VWd4cnBNdnVPNnlkSFFScko2SFp4?=
 =?utf-8?B?alNibFlDZXk4YWpndTU5cVpKUDBYamNMeGZGVzkvWGpQNjRkSzZSQ1hSSk1i?=
 =?utf-8?B?TEVJWEFmRW5Oeis1NC9ERHhVUHdpbWxxQkFxQjgxOUhVUVhFNS9GbjVoa24x?=
 =?utf-8?B?ZW5semlUdlhJV09PYm1obDdyd21ob2pGZ1ZXUUIrU2RUNTJtMjRLOUQxQ3py?=
 =?utf-8?B?YndwRXVtL0p2NjBuWHllcWlQeVhBbWpUd0t3OC96TTg3ZUtTYnYreENJMDU1?=
 =?utf-8?B?b3VJMFdVZFJXY2lMbDFhbjNodnNFVXd5V3RieGVOTkN4OThGelMzTStrb2hj?=
 =?utf-8?B?dUZlbmpRb1B5VzBPcVkwV2JPcGNtM0JpdXkwaVl4TGNTVExEVWVDb1JXSWhM?=
 =?utf-8?B?TzR6bEZEOWNMYU82aUxqRXZiOU51RUt3S3E1T2p3Mk0wS2RML3RyZEZIQ0Fu?=
 =?utf-8?B?b0ptektzRWE5RmZWOTdReHM5M1dDQW00Rzc0Y3FyakwxZWplS1I5aXZVeG1j?=
 =?utf-8?B?RTFTV3dMK0liUkN3STJKcFc2Y2phOHhlQzZoUzduT1lrUzdLeEJrdGUySDFW?=
 =?utf-8?B?NXJsLzl2SG5lUE9oNXVtdGVmNTU5TWljU0w1bkUvQUVSTUpxZWhDeXJRdVFi?=
 =?utf-8?B?NFFZbk1TQzM5Wnp0NVlsdXBDM3BWbVQzaGpoTGVyMkxjZXM3ZGgvOWlSNHor?=
 =?utf-8?B?MHBNbmp6NWpTTW02S01tblJ0MldpME93d0tOd3Y5d1UvZW52bnd6TUtCNk1V?=
 =?utf-8?B?aEw2UU1ZdFBBbmZjWU10TUZ2VWpSZERYV05wQ243eFpUSk1YV1BmQTlxUTRz?=
 =?utf-8?B?U3dSdEdFTElwc3ZLK1l1Q09zaTdPeEdMbFdITkF1TWljc1M1R1p4Z3RzVDI0?=
 =?utf-8?B?T3dVc1NYNWxFS25tekZWUzhLMUdSL2xON2RUVm4rbzVCSk8xdzZScDUwTFNu?=
 =?utf-8?B?RTBiQ1dJV084SFN6VUdnTWdoN0JwcEFIc2JldlBrRGw3Y2lDQ1hmNzdlYk1K?=
 =?utf-8?B?RGF5M2hKNEh6cVRmVklOZEEzRzJWeU11VTJnbFg0Nk9zVzNFdk9jZXE3UTVs?=
 =?utf-8?B?VU1BcXpxdk1INEtQNk0xYWx3TUxHSEpHRi8yb3FrK1BkT21Zb3ZLQ2Z6VVFJ?=
 =?utf-8?Q?BLa9Ic29Qcv1Slp/Q/XGNdoK4dJBRTmd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVRlamdrSHdJY3kxeHlET2NzV1hzMkRyVVdrY3RWRTgraTRRczdKVE5kUldH?=
 =?utf-8?B?MTgvZkh5cmxRVlA5aEZ0Nkp2WGF5YzIzZUxKaEQ3dWNGSGU3b3ZOZk44RUcv?=
 =?utf-8?B?YVp0bkd1cUdZa3kyeDV3MURGK0draUx0NGVkOHJlek9IVGNncnp3bU9rRkhh?=
 =?utf-8?B?aGcxTDRvNENub2J0elduRFhCZG1RTlhYR1dyMU11Yi8xVGdLRUFvSGZkMzRQ?=
 =?utf-8?B?OUtFalkzNDJnZGUyWEV6bFVlNUdsNnFOWkxuNXRXK2xkQUJuM2NjMlVxWVFR?=
 =?utf-8?B?WFZaaXRtLzRkK1FxTzBmNFB0bk9DaW04YlBmaVFIakpYSy8yV21hY3crYWJV?=
 =?utf-8?B?VWxJYS9xT3pYa1M0cUpUL3c3MHNscW1IQld6MzA1YTRRL2dBeUFpdWRiQ1hO?=
 =?utf-8?B?WnNEVmhEUnkydDJCNjhidDNyVGFVUEtBV1NzeHBXTlZLdFluRllnSEQyYXJX?=
 =?utf-8?B?UThVelpOWmFLdWJDMTVqemtvQkhyRndpMjAybjRJUjBWZE5SNWI0Q3ViNy91?=
 =?utf-8?B?U1h3YkZuM29ON0Y4c1VKUVEzQk5kMkZaRlZVMFNTSmtWUVNwam5yRlM1Y3B1?=
 =?utf-8?B?NkdpbnhNaGhRa2lHMEIzNUVBRlVyeEtTK3lwSDN1bDBpOXJMZVlyWkZWbHN1?=
 =?utf-8?B?amF6N3c0a1BhVTZ1UzFMQkJCUnRMQU1ZdEdIejgrdC9KQzFFTWFRMitnK04v?=
 =?utf-8?B?UWhabThQWlVKcVlrS28xR3J2OTVPSmlFeG5NcmNLcWhhTDdVd1A2WndpVFJs?=
 =?utf-8?B?b0s2UU00WW9DNi9RS3FQZG8xZ3NyTVZLYy9GUkVYOVdOQjFldmxQNkFYVmFY?=
 =?utf-8?B?UmtFL28zOFlVRVZrUzZqQmpkT3JJalpMZ3ZGMXhLR0lPMEVucUdCdXg2ZkZr?=
 =?utf-8?B?NUdLU05LWnJPNTZjazRoalp6S1VaQlJhUENHVy9LbjRXYUtRZmNlRDJvYzNG?=
 =?utf-8?B?ZTQrMVdTK3cveEk0a1lhN3N4UDkveUhTYzhESk0xbnNnK3Zhak9NYUtUTjRI?=
 =?utf-8?B?d1Q4YkJrN2V6WUJPNCtjRER3b1d5N0UyY2dtdWMyMU5adTZST2FPNzZOdVhy?=
 =?utf-8?B?OVJ5aTFHc3VCaVBUZ3kyeFQ1cWxQWG1wb2ErSmdlMnpjK1FqTk1QR1V0RVAr?=
 =?utf-8?B?bnFRdzFNVTIyN0xFU1d0QUhIcE56N3dPOVVydTFNNmJIUi8zRGhrVUo1SFZ1?=
 =?utf-8?B?WWc2S3V6aGRvWTZTd3FUWDdXWHQvdS9vYlJIU05CL0xwRHZVTnBidExkM0dN?=
 =?utf-8?B?N3pjRG9XMEFNUVVjR3IrVXBHQzZLWHI5WGhWdGsyVDBpMWIzZmxFMmVJWDcz?=
 =?utf-8?B?UDRoaGpENi9JUzhyeEVUaDVjVkN2ZFh1RThSdmtoM2NtRVFveVJsSTdMbDkw?=
 =?utf-8?B?MzNMZUg5NFhNYlk1ZVhrcUZIa00vbnozd1l2S21sNVNSbTVkMmVXNjVNalgy?=
 =?utf-8?B?Nmo4RERDMWY4eVFrTytBRlUrVlI1TWhLR3oveXB5dzFGZGpkbkNoSjkwT0dJ?=
 =?utf-8?B?VWtMdEljd3VGMGI5QzVxeUFlME1USllRNmErWk1WWC9CWlB0d1NBVlptY2t0?=
 =?utf-8?B?bVNnbEt1RzRPMXNhQWNTek1ic3VNcnFFeGQ5VkJRc3FNSzNZY1YvZHdCaitB?=
 =?utf-8?B?NGtWY2J2MkIyY1hTN0FkUnEydUdYZVBtT0hMUklyOHlwbThBWDJUdHlsNmhH?=
 =?utf-8?B?L0VocFZrMFEvaUtqdnpEbkYzSnc4Z2xMdjMyYnljblhycUhJR2hRbGxPMk9M?=
 =?utf-8?B?cW5ROXRzTzYxZVV3eEx1YTNNMmkyb2dqQWpUa04rWVBYUmREdTFBWHlGRGZY?=
 =?utf-8?B?dklRVVBqcFlYOXdoeHVvMXhVbUNFRG1yc09wT2VXWTA1d1NTR0VjdzBNSG5l?=
 =?utf-8?B?dTc0aTg4UzVFa284cUtoMmZFUkF1b0NWM2txcHBrNnJQVVUvR0xLQ0N6akxB?=
 =?utf-8?B?b3BuMDhnd1Q3VkxPS1Q1R1ZSY25kdE00WWQ4aC9LaGFRai9BUWVNcXd1NTVN?=
 =?utf-8?B?Q2hyN3NOYi9hTDVqL1BHcjNvZm9HZXdwWlpYWlZucS9FYVlPSFM1c0RUZ1Ri?=
 =?utf-8?B?VkY2UnRzNmJxNTAvK1FMWjExNGtNcHdqQzRzK3JRNGFaQjZrcHlJUGdZL09z?=
 =?utf-8?B?cEhmSlhYVXZTSTJaTlhyWWczZkd0K21NQjBhQkFrTEpyYjhTUFhWQ2JhUlBh?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <405208D81EF5EE4988DE90C8B2B47C57@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021408ca-2397-4324-aa28-08dd3fc70be7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 18:10:28.6910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pNJVVgFzBHemRm9tDa3aGWYW1vfHB5crgGc2abZ/NKSUo0cWeNZz06JmbbdZ/gB73zi02aKPH/jQM51/wFYk45NH7eExP9VxaD1Rjg1ZamM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5154
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

TEdUTQ0KDQpSZXZpZXdlZC1ieTogQ2xpbnQgVGF5bG9yIDxDbGludG9uLkEuVGF5bG9yQGludGVs
LmNvbT4gDQoNCi1DbGludA0KDQpPbiBUdWUsIDIwMjUtMDEtMjggYXQgMjE6NTAgKzA1MzAsIFNo
ZWtoYXIgQ2hhdWhhbiB3cm90ZToNCj4gQWRkIDMgbmV3IFBDSSBJRHMgZm9yIEJNRy4NCj4gDQo+
IHYyOiBGaXggdHlwbyAtPiBSZXBsYWNlICcuJyB3aXRoICcsJw0KPiANCj4gU2lnbmVkLW9mZi1i
eTogU2hla2hhciBDaGF1aGFuIDxzaGVraGFyLmNoYXVoYW5AaW50ZWwuY29tPg0KPiAtLS0NCj4g
wqBpbmNsdWRlL2RybS9pbnRlbC9wY2lpZHMuaCB8IDUgKysrKy0NCj4gwqAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kcm0vaW50ZWwvcGNpaWRzLmggYi9pbmNsdWRlL2RybS9pbnRlbC9wY2lpZHMuaA0KPiBp
bmRleCA3ODgzMzg0YWNkNWUuLmU1M2Q3ZDliYjY0ZCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9k
cm0vaW50ZWwvcGNpaWRzLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vaW50ZWwvcGNpaWRzLmgNCj4g
QEAgLTgxNyw3ICs4MTcsMTAgQEANCj4gwqDCoMKgwqDCoMKgwqDCoE1BQ1JPX18oMHhFMjBCLCAj
IyBfX1ZBX0FSR1NfXyksIFwNCj4gwqDCoMKgwqDCoMKgwqDCoE1BQ1JPX18oMHhFMjBDLCAjIyBf
X1ZBX0FSR1NfXyksIFwNCj4gwqDCoMKgwqDCoMKgwqDCoE1BQ1JPX18oMHhFMjBELCAjIyBfX1ZB
X0FSR1NfXyksIFwNCj4gLcKgwqDCoMKgwqDCoMKgTUFDUk9fXygweEUyMTIsICMjIF9fVkFfQVJH
U19fKQ0KPiArwqDCoMKgwqDCoMKgwqBNQUNST19fKDB4RTIxMCwgIyMgX19WQV9BUkdTX18pLCBc
DQo+ICvCoMKgwqDCoMKgwqDCoE1BQ1JPX18oMHhFMjEyLCAjIyBfX1ZBX0FSR1NfXyksIFwNCj4g
K8KgwqDCoMKgwqDCoMKgTUFDUk9fXygweEUyMTUsICMjIF9fVkFfQVJHU19fKSwgXA0KPiArwqDC
oMKgwqDCoMKgwqBNQUNST19fKDB4RTIxNiwgIyMgX19WQV9BUkdTX18pDQo+IMKgDQo+IMKgLyog
UFRMICovDQo+IMKgI2RlZmluZSBJTlRFTF9QVExfSURTKE1BQ1JPX18sIC4uLikgXA0KDQo=

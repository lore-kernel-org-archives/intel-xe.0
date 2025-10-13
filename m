Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A19ACCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 21:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C32510E4F8;
	Mon, 13 Oct 2025 21:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqzghf0C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2570510E4F8
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 21:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760392087; x=1791928087;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NQlPRrUm86+5YmjHcKY4TDhXX4QCAFqlqS9PTulJmX4=;
 b=iqzghf0Cn3pmFMS2+P+ac1uNPZ5RRGwm1s2WyRCtu4kGeTmntDsFcMfg
 PPKYMqYjv/i8M4CEbhN859YF8AXVaCSclc5B/YSwY5I3jdDMo5wV6B2JP
 MfWeLgC6PSmKbkw+dUP8A0Ahy61y8bybmxzAze2p43Pt16h14CwqBYUf9
 xYVSzTkEGpUywirTnig0xKec0mK8uElrHlPjpPb/cJeWIcMzqC4F/Fu3X
 GKxnzR4nJ09RIn43zUZKZKYXEcOKkDHvM+6CyyZCWMDKulfI9+SHTRV13
 vYzO8Rm5zVd6jdQlRQmY6IfEvdBd6t0AEUEwnO32gwzfc2I5GmwUl0/rP g==;
X-CSE-ConnectionGUID: eiQXjjVwQy20rJrk1HG0Zw==
X-CSE-MsgGUID: 0ySWc3YRRXWe9q0sVQrH+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="80181550"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="80181550"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 14:48:07 -0700
X-CSE-ConnectionGUID: ugXg47EjRRGDFay2YHPArA==
X-CSE-MsgGUID: asMb0aJ5QICUdCDEowSvYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="182135598"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 14:48:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 14:48:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 14:48:06 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 14:48:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiBZu8ZLMAPVnjr4Uh5h8gxyi1kojANsULjZ4WrCsjsITos1k6ZYt8aMLT4wkeiQ+EV//tMMyvINudMIp9aKPtJoKt03h6VJLASWjxd2GtX12nLo9JQ8JzrMuyfvDh3V8IJinRRnsErKWGi8qJZaERg6Mu65uEgOLWvrSxJQiUHi09ZmaM+96Nx+okSszUlX52FHZhTD0zlN+FQzB4mSYj2C3ZnFfvjJqzoeN3VwtwBDycyaBKbQBV0u9anMIQTc2LwHKv3+JyTS0QbcGZkgJPd1GKbJFbjZIa13caZZvUiUklU0SH+tPJ8YJeAoEN0pUZ6ad5ZnwDPqIUcJd53zNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQlPRrUm86+5YmjHcKY4TDhXX4QCAFqlqS9PTulJmX4=;
 b=iukoZvmy2pe1teo+5pHSOt5FDhmtXFdQ0X2E/GizYoOY2xTzXXdcCKh9poRF/fwQHcCspf4QRf/1JT1z9b1aYSZGUGrspkvr7c82tDNUndYdzX8jg9Wlzs7cVdx7mNnETwACKc0f64CbRMct+kIktJpqz/ot1wrbelkfKvCdQW7Vr4CPOzJWErrkKm7/WXT7w+/GAIqzTHbH10/HEHwFTyQMEq/YNYptNACms8for4acoL+G8RnMWXQdZB0cFKdlXVDOW8yB8oZDJzOeuRI8Cb6b6vBokxZfRTDDI1cb0+3xM6ULHYpBP+fXcFE4hkkyYrFu6hwp7SOOIETGGEhqdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH0PR11MB8215.namprd11.prod.outlook.com (2603:10b6:610:182::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 21:48:04 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 21:48:04 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/7] Fix a couple of wedge corner-case memory leaks
Thread-Topic: [PATCH 0/7] Fix a couple of wedge corner-case memory leaks
Thread-Index: AQHcPF34a4GYp0yTyUmcSAgKr7VLRLTATg8AgAACpoCAAEypgA==
Date: Mon, 13 Oct 2025 21:48:04 +0000
Message-ID: <8d6d05faa1559350a8f01b101d43df379657c324.camel@intel.com>
References: <20251013162504.7768-1-stuart.summers@intel.com>
 <aO0xDCa/rTPp9++8@lstrano-desk.jf.intel.com>
 <1bfb886a6e891b249d754b8b0dbbc5be41594f9a.camel@intel.com>
In-Reply-To: <1bfb886a6e891b249d754b8b0dbbc5be41594f9a.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH0PR11MB8215:EE_
x-ms-office365-filtering-correlation-id: 72b95955-0b33-4877-aa9d-08de0aa2307d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?L1AzMk0yV3RRYkJadXBMY0FHbTJnS2RqdWZJekNsTlhkeDFVY3ZDRytkWEoz?=
 =?utf-8?B?M203YjNDa3I0WEtPS0E2VnZiSXk3RW45MkY4c2FDdGNwQUZ1a1RMazdnVG1Z?=
 =?utf-8?B?WEdOMWw4Q3AwMCtzK2NsdGZ6Nm5aR3Mvby9ORVcycG9kM0xMeC9lRkZXelJo?=
 =?utf-8?B?cTloak9SSzlIWmtJOFdVVTlxRm8yWDFEWTJmTVlQdDBHd3J0REFwQjhRTklO?=
 =?utf-8?B?eGZKTks1NjNKUDE1bFk5ZVltd1lhWEdpU1IrMlI4Qnp6cGxuSHlQbDBNNTds?=
 =?utf-8?B?dzhMR1VieEZmbmU1NXdaeVFqODYwMjFHNytzRFZjTzdxTndxNnU4ZkNKekRI?=
 =?utf-8?B?bUNvZ290NmpkcmlhNWpIUjRadEhsS2g1NW4vMlZROHQzQVMrMk5Db1pmaDdj?=
 =?utf-8?B?TEhZaEV6eWRObmpOdWNyUnVRb0lwK3E4d0kxSmNTODMwd2JGRk5YaFcxcnUz?=
 =?utf-8?B?Q0tRNkgva25iSXFzZEpvZDZuV0VqZ2VRbnJVQnA0TWdDRitJUG9GTFpjSXM4?=
 =?utf-8?B?dk54MFRBdlF6R0hsN1ViYmR2VjJ1SGF5MFkvS1hMckdVbVhzcGdmQ1VVZWQ4?=
 =?utf-8?B?WjBabGd4Ym1MWjU4ZmpoRUdUMUszVHVHWDZNU00zN0Vzbm45M3cvT3REZGhp?=
 =?utf-8?B?VGlVOHNMYlU4Rk9lR2VJei96NGh5ZE5XSDFnS3BWZ2t6QVB6UTFsUFluVVds?=
 =?utf-8?B?WHYrU1BNR1d1T05zNVNpTm1Xb0FpOUNMZm1pWm5RaXh5RjZoSmczZEtucFBT?=
 =?utf-8?B?clZPaVFldFJVdkNlQkFMK1RYdks4Q2tTdmdLQjdsSUZLSGdhSUtENHJzN3RV?=
 =?utf-8?B?UmlhbXZWSGFTbjBNWEdYYm42cnMvdVdJNHNqQTZ5TEFBaWFmK3Y3eWxyZDFJ?=
 =?utf-8?B?ZjZpanE5NS9DRFBkd0ZsL0FRdTQvYkdiRGk3VHBuaVZ3RHlUL1JGS1g1MFQz?=
 =?utf-8?B?eS9DK2k0dkxRZjA0eVR2cElZclFUWWtLZ3RxdkpHa2ZxREVNbi80VmxSUG9v?=
 =?utf-8?B?ejdPbVcrTUhJcyt0Y015Vm5XcHVhVDA0Y0JYSzN1c0E2KzBRMlR1NnhiVm1r?=
 =?utf-8?B?NDZmOEEveTJ0cldMRUtZdFJCTkpVVU9JQlpVTlByb3J5LzF2NzVneUlJaHRO?=
 =?utf-8?B?QTE3L2RkWmc1ajkxUDJqTVBqMTMzU3JxU1lVcDV3YUUzNnZzL3MreWVta0R1?=
 =?utf-8?B?WXZubmRsSThtckdsRW8rVlpGRmJwc3RkWG9nYkMwbTFOSUtTVFRmR2ZKeXF4?=
 =?utf-8?B?ajNPTTlYOTJpaDNiVzIwczlDSy9PZ1g1ZkpVMkM1blltWTVlVXRYUmJYT2ww?=
 =?utf-8?B?YmxsZzMrd0dFZ3ZuZ2dqN2ZUbjhtZlpiejhWUUl0S2tFSjZZelBld21HWktn?=
 =?utf-8?B?QkdHa0UvZ1JCcFo1RlZrbkRwNDR6ZTlRRmpaOFliSTgrejFSYk5yUU1KeWc5?=
 =?utf-8?B?NHhXcWpMdHJvKzBpdFBJUzJSREJRalFPaWtjMHppeUtNUXpZVmpsVjEwR1NY?=
 =?utf-8?B?MWU2VDFWMlJVSDNUZy9hZmZWajFBdkt3Q2dBQ2d1UDIzbWhVNDViK2YzdWZE?=
 =?utf-8?B?dENEL2JIVDJJSm5uUktiUktjcC9ySXJCdUZ0dVVGNlppeGhyZHRERFA2cHlX?=
 =?utf-8?B?bng1S0lDK1ZIcTlNekJ5b0N6elB3Myt6K2JBak43VnZCbVZveElLbTcxcWls?=
 =?utf-8?B?eXZJWmlzcXZIL3pGUmYwRHArU1IxVzhQcURoNTU2b2RUUG1JeVJsN1dQcWxY?=
 =?utf-8?B?VCsybW5xTHh6M2tOZmMzSjJJdWRXa0M4SWx3alJ2dVZqOUNMZXc0SWZQWDQz?=
 =?utf-8?B?Sm9MakY2M3lxbTVnWmF6NWl2ak1lcUp3RVllRzNZL3pEU3YyUktHZ2NQdXE0?=
 =?utf-8?B?NHJwOUdYekhtS0owaGU3QUh5WUFFc3ZHVTZrS0Y2S0RkZzZ4UU8rY3FPL3ZE?=
 =?utf-8?B?SmFSbnNkSW0xUlVPaCtBZ1NVN25CVzFWOFJSQk9wWURBQmlLUi9aUk9pNFdz?=
 =?utf-8?B?UzM3YWhOWWNnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0ZRSmdTalQ4eERHa3FnaDd5TmpmMWJHcGhEOHFlNmNNSnlGM3g5WVFzTXRu?=
 =?utf-8?B?QWxXTUxXOFExZUZ6cU8wUzQxT25XQzRGbWRibjVJVHJoMHB6Q3RWVnU5US9y?=
 =?utf-8?B?RWd6Yit4TXNvbHhONmRXeU9wVHlBeTlCRmhUZmdyM0UwaG4yM1BMMWpDQVpp?=
 =?utf-8?B?d2JyWmtBcTZzN1hmaUhrakE0bmhBMG4wTVVZUEptd2JCY1lRK1YrckZ1ZXZ5?=
 =?utf-8?B?Y1JIbFJBWE5GUXFNMGRLMjhabnQ0UnY1YWJrT2s5d3lsUTVSeE14U2RyM2sx?=
 =?utf-8?B?cFlNUWsvZGc4SnRUeU01UWNTcWdOaEl4WDN5aDJHVndGQ2pMZGJsMzhKMjhN?=
 =?utf-8?B?NzV6OTlMakJsNHVWeEZBS0pWNzk5OHJwc25TUTVZS05iOEtPbkRCVUMvRkN2?=
 =?utf-8?B?TzN1amFwWlUyUmJEQ3doY3BCOW9mR3dFZkZxVGhKVUpvbEJXQVhVdHVqYWxF?=
 =?utf-8?B?QXpHelhGWkdDbjlQdmJRVkRLbWpNc2h2bFJ6ajE4YzExMDhWU0pYSEdYZjJ5?=
 =?utf-8?B?UzBnNE9aOGJkd2hwWGJ0M0FRN2tCU2JLYUUzUFd1OVp6VGg4bTZQV3ZQTGI5?=
 =?utf-8?B?TWpVWEx4TFNiOUV2Y0hZekI5UW1PNUIvVkFTV0NJYjRUbldHeG5jSnRCeURT?=
 =?utf-8?B?bjIyeE8rRnJ6NTd0dFdESnpxakNvUkFNdm0rak1QN2JMcjJBU2J2MGpmYkxZ?=
 =?utf-8?B?RTY5azgxNTVXYzNXWWZuVW45Q2xEUFlqalM2RUdjK0ppOCs2KzJoeWxiV3BL?=
 =?utf-8?B?dGJqRHBMeVFmZmVwVkc4QzlqUzVVSWNMUHRIcHpYNmdySEpsMHpRRzArcHRY?=
 =?utf-8?B?d21oOHNob3RTbGVWL3owQ2tIL05kZVBEKzFRcERJZVNjd25zM0IvSThkSnZw?=
 =?utf-8?B?cDBqMDBocFRSRktNU1RVMnBnSFZJYUZ6eGM0SnRyVGZFN3REb25uSVZPcXVI?=
 =?utf-8?B?T0RqM3hVMmFONWlpNGoyTWc1WUZ1amN4aHl2YXRQWjU2clZpcWNxalJLVzE3?=
 =?utf-8?B?RDFYaU1uNkh4dzJvbHArcmY0MHNwQ1BkcUlJK3Z6TjlRQ0JvM0xKRTV4cVJ2?=
 =?utf-8?B?SEJqVENBU2QzN2JvWWd5WVhUdnduVmduYk5JYlROQUtaWVhSL2pZUVV4VCsy?=
 =?utf-8?B?WGNKTlk5YXF2c09BazNESG4wZ2t5OFJYWngvR2huZldISUhRV2sycDJzME9x?=
 =?utf-8?B?L3g1T0tiUkJWWHNJeXVCZ0h3dXAybFBReHN1aVJNaUpIRWZWTU1CUnp5TlZI?=
 =?utf-8?B?ZjB2VTFhY0ZWQlNJRUM0ajJ3R2JXY2ZIL3V6cWg2cEhKb2x3QTdhUTZ0ZE9X?=
 =?utf-8?B?dFNyY0RaaWpUZ0NXNDN6UU9lMXRKZldObXBqcTdCRG8xNUlZM0JvQjJldlc3?=
 =?utf-8?B?NzRaS3JiRGdUeFpLV3dwblZFTGZiZitEd2JCV1NmS0dHQzhIRm1UNVhXd1Zo?=
 =?utf-8?B?U040bU9TNTFBbU1NRjlpM3kyNWtCc2N2Nm5KV3RhUDkxMGRBamlDTkx5TmVM?=
 =?utf-8?B?QnZGRjVBUzJDU3pjMWZSbEI1QWVmcVErLytVemxiYXo2aGRwMUh2bG1yQUZZ?=
 =?utf-8?B?ZW1KOFFremVxTFFIUEJ2WTMrUEFPc0xBb3FkcC94WEFkc0dlcDZtYlNIZ1Qx?=
 =?utf-8?B?WUk3SjZxdCt4RllTTDl1OFlJV2lOeE1oY0RSSFg3U1FXWWcwa3ViS2EvZkEr?=
 =?utf-8?B?N3JwUThKWkRIbUJJL05CaitIaXFJaDVPYTRJbTV3NVRTYUNSTjB2anFHd1lP?=
 =?utf-8?B?ZS9RNCt0eXFKYkp3V1lIYVpFNVZRZUJlK3owTkxhamw3dUsvL0xRZW1xa0RJ?=
 =?utf-8?B?dU0zTENRaWZhR0tkUEF0RUVyaHo1aWFZSDAzN3FVVDhhc1JxLzdwTFhRb0Uv?=
 =?utf-8?B?K21nT3YxaGJvWkNFYnZDclJXczhLRnpPUnJkaEk5TEt0a2RCR1dXWSswaUkx?=
 =?utf-8?B?NEtkN2FnRGFRUElMNDIxZitUaHJ5UXA0MmQybUF4eXRYUGIyK2NyZ2lqTW1j?=
 =?utf-8?B?WEFZK3hqUmF5MytQb0xwRW9zcm9tTnZ4Mmx6ZzJpczJZbURkdUtPU1ZlS29x?=
 =?utf-8?B?elV1TVVRQ25JSVpQTUg0dFhEMVFETTRFdjB3ZXcyeFBjZ0tmOE9uL1ZMWWI5?=
 =?utf-8?B?V0pCVDdiaFgxZkIxTTRNNy9haVh3MjhzTTlzSE5DSloyd2F4bUhkN2s3RE9i?=
 =?utf-8?B?Smc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74F3407F04228C4AB20B9F5F76E691E6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b95955-0b33-4877-aa9d-08de0aa2307d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 21:48:04.7122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ee8hLZQEg4l0XiiT/Rk7BpAxHsfQwsoMhd3+aKrv2MSmKJ1k4DNhPPtdj+X3c0Yxki4Ql15Wl1J0DEkfVIevxTEBuhvp11D4vkv9iBGCm8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8215
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

T24gTW9uLCAyMDI1LTEwLTEzIGF0IDE3OjEzICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIE1vbiwgMjAyNS0xMC0xMyBhdCAxMDowNCAtMDcwMCwgTWF0dGhldyBCcm9zdCB3cm90
ZToNCj4gPiBPbiBNb24sIE9jdCAxMywgMjAyNSBhdCAwNDoyNDo1N1BNICswMDAwLCBTdHVhcnQg
U3VtbWVycyB3cm90ZToNCj4gPiA+IE1vc3Qgb2YgdGhlIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMg
YXJlIGp1c3QgYWRkaW5nDQo+ID4gPiBzb21lIGRlYnVnIGhpbnRzIHRvIGhlbHAgdHJhY2sgdGhl
c2UgZG93bi4gSSBzcGxpdA0KPiA+ID4gdGhlc2UgdXAgaW4gY2FzZSB3ZSB3YW50IHRvIHBpY2sg
YW5kIGNob29zZSB3aGljaCBvbmVzDQo+ID4gPiB0byBpbmNsdWRlIGluIHRoZSB0cmVlLiBJIGZv
dW5kIHRoZW0gdXNlZnVsLg0KPiA+ID4gDQo+ID4gPiBUaGUgbWFpbiB0d28gaW50ZXJlc3Rpbmcg
cGF0Y2hlcyBhcmUgdGhlIGxhc3QgdHdvIGluIHRoZQ0KPiA+ID4gc2VyaWVzIHdoaWNoIGFyZSBm
aXhpbmcgc29tZSBjb3JuZXIgY2FzZXMgd2hlbiB0aGUNCj4gPiA+IGRyaXZlciBiZWNvbWVzIHdl
ZGdlZCBpbiB0aGUgbWlkZGxlIG9mIGVpdGhlciBjb21tdW5pY2F0aW9uDQo+ID4gPiB3aXRoIHRo
ZSBEUk0gc2NoZWR1bGVyIG9yIGluIHRoZSBldmVudCB0aGUgR3VDIGJlY29tZXMNCj4gPiA+IHVu
cmVzcG9uc2l2ZS4gSW4gYm90aCBvZiB0aGVzZSBjYXNlcyB0aGVyZSBpcyBhIGNoYW5jZQ0KPiA+
ID4gd2UgY291bGQgbGVhayBtZW1vcnkgYXJvdW5kIHRoZSBleGVjIHF1ZXVlIG1lbWJlcnMNCj4g
PiA+IGxpa2UgdGhlIExSQyBhbmQgdGhlIExSQyBCTy4gVGhlc2UgcGF0Y2hlcyBmaXggdGhvc2UN
Cj4gPiA+IHNjZW5hcmlvcy4NCj4gPiA+IA0KPiA+IA0KPiA+IE9rLCBJIHRoaW5rIEkgc2VlIHRo
ZSBwcm9ibGVtLiBJIGJlbGlldmUgdGhlIGNvcnJlY3QgYXBwcm9hY2ggaXM6DQo+ID4gDQo+ID4g
LSBBcHBseSBbMV0NCj4gDQo+IEkgZ2V0IHRoZSBuZWVkIGZvciBbMV0sIGJ1dCBJIGRvbid0IHRo
aW5rIHRoaXMgaXMgZ29pbmcgdG8gc29sdmUgdGhlDQo+IGlzc3VlIEknbSBmYWNpbmcgc3BlY2lm
aWNhbGx5IHNpbmNlLCBpbiBteSBjYXNlLCBHdUMgaXMgYWxpdmUgYXQgdGhlDQo+IHRpbWUgb2Yg
c2NoZWR1bGUgZGlzYWJsZSBhbmQgYmVjb21lcyB1bnJlc3BvbnNpdmUgb25seSBhZnRlciB0aGF0
IEgyRw0KPiBpcyBzZW50Lg0KPiANCj4gQmFzaWNhbGx5IEkgdGhpbmsgdGhlcmUgYXJlIGEgZmV3
IHRoaW5ncyBnb2luZyBvbiBoZXJlLg0KPiANCj4gSSdtIHB1bGxpbmcgWzFdIG5vdyB0aG91Z2gg
YW5kIEknbGwgdGVzdCBhbmQgZ2V0IGJhY2suDQoNClllYWggdW5mb3J0dW5hdGVseSB0aGlzIGRv
ZXNuJ3QgY292ZXIgdGhlIGNhc2Ugd2hlcmUgd2UgY2FuIHN1Ym1pdCB0bw0KR3VDIChHdUMgaXMg
YWxpdmUgb24gZGVyZWdpc3RyYXRpb24vc2NoZWR1bGUgZGlzYWJsZSkgYnV0IHRoZW4gR3VDDQpz
dG9wcyByZXNwb25kaW5nIGJlZm9yZSB3ZSBnZXQgYW55IG9mIHRob3NlIHJlc3BvbnNlcyBiYWNr
LiBXZSBqdXN0DQphcmVuJ3QgdHJhY2tpbmcgdGhhdC4gSSBzdGlsbCB0aGluayB0aGUgc2Vjb25k
IHBhdGNoIGluIHRoaXMgc2VyaWVzIGlzDQpuZWVkZWQgZm9yIHRoYXQgcmVhc29uLg0KDQo+IA0K
PiA+IA0KPiA+IC0gRW5zdXJlIGFsbCBzY2hlZHVsZXJzIGFyZSBub3Qgc3RvcHBlZCBpbiBndWNf
c3VibWl0X3dlZGdlZF9maW5pDQo+ID4gDQo+ID4gLSBDbGVhbiB1cCBhbnkgbG9zdCBIMkcgaW4g
Z3VjX3N1Ym1pdF93ZWRnZWRfZmluaSBzaW1pbGFyIHRvIGEgR1QNCj4gPiByZXNldA0KPiA+IA0K
PiA+IC0gV2FpdCBvbiBhbGwgYXN5bmMgc2NoZWR1bGVyIHdvcmsgcXVldWUgb3BlcnRhaW9ucyBj
b21wbGV0ZQ0KPiA+IHNvbWV3aGVyZQ0KPiA+IMKgICh0aGlzIGlzIHBhcnQgb2YgVkxLLTgwMjYz
LCBJIHdhcyBnb2luZyB0byB0cnkgdG8gbG9vayBhdCB0aGlzDQo+ID4gcGFydA0KPiA+IMKgIHNv
bWV0aW1lIHRoaXMgd2VlaykuIA0KPiANCj4gT2ggdGhhbmtzIGZvciB0aGUgbGluayBoZXJlIHRv
byEgSSdsbCBzZWUgaWYgdGhpcyBmaXRzIGluIHRvIG15DQo+IHNjZW5hcmlvIGFzIHdlbGwuDQoN
CkkgZGlkIHRyeSBhZGRpbmcgYSBndWNfc2FuaXRpemUoKSBpbnRvIHRoZSB3ZWRnZV9maW5pKCkg
ZnVuY3Rpb24gYW5kIGl0DQppc24ndCBoZWxwaW5nLiBJJ20gc3RpbGwgZGVidWdnaW5nIGhlcmUg
dGhvdWdoLiBJIGFncmVlIGl0IHNlZW1zIGxpa2UNCndlIGNvdWxkIHVzZSBzb21ldGhpbmcgdGhl
cmUuDQoNCncuci50LiB2bGstODAyNjMsIHdlIGRvIGFscmVhZHkgaGF2ZSBhIDVzIHdhaXQgb24g
YWxsIGV4ZWMgcXVldWVzIHRvDQpjbGVhciB0aGVyZS4gSSB0aGluayB0aGlzIGlzbid0IHRoZSBv
bmx5IGlzc3VlIHRob3VnaCwgYWx0aG91Z2ggSQ0KaGF2ZW4ndCBsb29rZWQgdGhyb3VnaCB5b3Vy
IHZmIGNhc2Ugc3BlY2lmaWNhbGx5IHRoZXJlLg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiANCj4g
VGhhbmtzLA0KPiBTdHVhcnQNCj4gDQo+ID4gDQo+ID4gTWF0dA0KPiA+IA0KPiA+IFsxXSBodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1NTQxNy8NCj4gPiANCj4gPiA+
IHYyOiBBZGRyZXNzIGZlZWRiYWNrIGZyb20gTWF0dDoNCj4gPiA+IMKgwqDCoCAtIExldCB0aGUg
RFJNIHNjaGVkdWxlciBoYW5kbGUgcGF1c2luZy91bnBhdXNpbmcNCj4gPiA+IMKgwqDCoCAtIFN0
aWxsIGRvIHRoZSB3YWl0IGFmdGVyIHNjaGVkdWxpbmcgZGlzYWJsZS9kZXJlZ2lzdGVyDQo+ID4g
PiDCoMKgwqDCoMKgIGFzIHdpdGggdGhlIHByZXZpb3VzIHBhdGNoLCBidXQgc2tpcCB0aGUgaW50
ZXJtZWRpYXRlDQo+ID4gPiDCoMKgwqDCoMKgIHNvZnR3YXJlLWJhc2VkIHNjaGVkdWxlIGRpc2Fi
bGUgdXNpbmcgdGhlICJiYW5uZWQiDQo+ID4gPiDCoMKgwqDCoMKgIGZsYWcgYW5kIGluc3RlYWQg
anVzdCBqdW1wIHN0cmFpZ2h0IHRvIHRoZSBkZXJlZ2lzdGVyDQo+ID4gPiDCoMKgwqDCoMKgIGhh
bmRsaW5nIHdoaWNoIHdpbGwgZnVsbHkgcmVzZXQgdGhlIHF1ZXVlIHN0YXRlLg0KPiA+ID4gwqDC
oMKgwqDCoCBOb3RlIHRoYXQgZm9yIHRoaXMgY2FzZSBJIGFtIHNlZWluZyBhIGhhcmR3YXJlIGZh
aWx1cmUNCj4gPiA+IMKgwqDCoMKgwqAgYWZ0ZXIgc3VibWl0dGluZyB0byBHdUMgYnV0IGJlZm9y
ZSByZWNlaXZpbmcgdGhlDQo+ID4gPiDCoMKgwqDCoMKgIHJlc3BvbnNlIGZyb20gR3VDLiBTbyBl
dmVuIGlmIHdlIHdlZGdlIGluIHRoaXMgY2FzZQ0KPiA+ID4gwqDCoMKgwqDCoCAobW9uaXRvcmlu
ZyB0aGUgaGFyZHdhcmUgc3RhdGUgY2hhbmdlKSwgdGhlIHF1ZXVlDQo+ID4gPiDCoMKgwqDCoMKg
IGl0c2VsZiBpcyBub3Qgd2VkZ2VkIGJlY2F1c2Ugb2YgdGhlIGFjdGl2ZSBHdUMNCj4gPiA+IMKg
wqDCoMKgwqAgc3VibWlzc2lvbiAoQ1QgaXMgbm90IHN0YWxsZWQgYXQgdGhhdCBwb2ludCkuDQo+
ID4gPiANCj4gPiA+IFN0dWFydCBTdW1tZXJzICg3KToNCj4gPiA+IMKgIGRybS94ZTogQWRkIGFk
ZGl0aW9uYWwgdHJhY2UgcG9pbnRzIGZvciBMUkNzDQo+ID4gPiDCoCBkcm0veGU6IEFkZCBhIHRy
YWNlIHBvaW50IGZvciBWTSBjbG9zZQ0KPiA+ID4gwqAgZHJtL3hlOiBBZGQgdGhlIEJPIHBvaW50
ZXIgaW5mbyB0byB0aGUgQk8gdHJhY2UNCj4gPiA+IMKgIGRybS94ZTogQWRkIG5ldyBleGVjIHF1
ZXVlIHRyYWNlIHBvaW50cw0KPiA+ID4gwqAgZHJtL3hlOiBDb3JyZWN0IG1pZ3JhdGlvbiBWTSB0
ZWFyZG93biBvcmRlcg0KPiA+ID4gwqAgZHJtL3hlOiBEb24ndCBibG9jayBtZXNzYWdlcyB0byB0
aGUgR1BVIHNjaGVkdWxlcg0KPiA+ID4gwqAgZHJtL3hlOiBDaGVjayBmb3IgR3VDIHJlc3BvbnNl
cyBvbiBkaXNhYmxpbmcgc2NoZWR1bGluZw0KPiA+ID4gDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9leGVjX3F1ZXVlLmPCoMKgwqAgfMKgIDQgKysrDQo+ID4gPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ncHVfc2NoZWR1bGVyLmMgfMKgIDYgKy0tLQ0KPiA+ID4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jwqDCoMKgIHwgMjQgKysrKysrKysrKysrLS0tDQo+ID4g
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0
ICsrKw0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmjCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgMyArKw0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jwqDC
oMKgwqDCoMKgIHzCoCAyICstDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5o
wqDCoMKgwqDCoMKgwqDCoCB8IDIyICsrKysrKysrKysrKy0tDQo+ID4gPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV90cmFjZV9iby5owqDCoMKgwqDCoCB8IDEyICsrKysrKy0tDQo+ID4gPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZV9scmMuaMKgwqDCoMKgIHwgNDINCj4gPiA+ICsrKysr
KysrKysrKysrKysrKysrKysrKysrLQ0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0u
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKysNCj4gPiA+IMKgMTAgZmlsZXMgY2hhbmdl
ZCwgMTA2IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+ID4gPiAtLSAN
Cj4gPiA+IDIuMzQuMQ0KPiA+ID4gDQo+IA0KDQo=

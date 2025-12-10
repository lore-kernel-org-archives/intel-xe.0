Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5C6D3C52A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 11:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F8C10E255;
	Wed, 10 Dec 2025 11:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBR4nHVj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA9310E255
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765365436; x=1796901436;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fYFCc4ZiW041oHp2r0xrzyhQ/HNQycC6GRfnqpfPU3Q=;
 b=bBR4nHVjzwlWQhaPiFhKYR5RB3YliQ3JM4MTTYV/6kH1AV0oDHEhgve1
 pC3FXWeQ4H9+TsEaxwACHqjwCToAyOz9WfF27qIM7mzSYzgHDtAy7kE6y
 kUYHJINEz2QhfZfP/7TtMlyXSU3UjxnSsOKG671F8LDcJwPn+qwmPk6RY
 dH19vFFpfg5DVPviAbKv6ax99qoNBq/6iHboK0qkaVGoCiRUKfHVemWV2
 YwoOMymAWriX/lgCR5VnmjDcXyisodDpRTn+aH2O8CjOm7tXlPs+bsqnm
 gCUEXzr0LhxWnfBKHlIhpKSEBz6HttTiuDE9sK8BbWIQbE52f6NZOnt/D g==;
X-CSE-ConnectionGUID: dQTzNyTdQhWys13XjrWQHg==
X-CSE-MsgGUID: DrdiyIy8TZK3R3HrtosAiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77951600"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="77951600"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:17:16 -0800
X-CSE-ConnectionGUID: 9mXwbf7pQ56yIJiBJpNOjQ==
X-CSE-MsgGUID: eEkL/O6lQeOaLj4DCdhIQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="201410988"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:17:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 03:17:15 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 03:17:15 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 03:17:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caFne/12l4BUH9ASrpzzIBmHnTnRF96i46jZGKX8JJwutG6wddW1hUSie5UmvZ61KUwT8K70LFum9dc9GAF8CmX2roplXkw29P90wZLLwNV1a5kBgs3wPFwe2Hgk755h5bJPBolGnHcYRcyDrftqZcya0OGHRmDfGOdkICTovxokSxJAuOoMf/Lbmg0i5al8cFu0g6hoxJIpWUcxW5GoTBADM4jNTWUcIsPnYpfaQ+LRw+1lfBk8VNsX28U9tX0rL3XrY23zk5+PGW1hkgidBFdW1v37b0SAUHRoIi//dUyAedFq68qRVgwmq9kbfbMxRUP46pr/M854fkP9I+bBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYFCc4ZiW041oHp2r0xrzyhQ/HNQycC6GRfnqpfPU3Q=;
 b=a1jTzHObRwCsSRJXUOijHSnCKm0Geb/kDho2QxOBDw4dODIt8BL7Y3YUGj5g/gwPFb3SDYp6Eg7ogCDurtaAD8dnntJ2f0iIndAAzSB8f66IR9crikHmKQ8AQq/w0027BsXb2l6o9+ikkvlH4wZF4OuhfcDP8XJb2JP5P4C5b4bftb9fT8V4c37qWD28WRIjgmOKmH1Oe9eNfRT7UiAYnAquxxToBRG9Xgs/PFUYh2/gvBhzpELSROSACnS9mtzYsc1gcdxrafEJnp0RbvIesYv0r4BPRqYoPvvugLzcaGtaFq1pqxceWYvj7FuV+vsP/bj3vpNzQt6wPCBK2BSXjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 DS0PR11MB6351.namprd11.prod.outlook.com (2603:10b6:8:cc::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.7; Wed, 10 Dec 2025 11:17:13 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%3]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 11:17:13 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, =?utf-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v15 06/10] drm/xe: Handle DPT in system memory
Thread-Topic: [PATCH v15 06/10] drm/xe: Handle DPT in system memory
Thread-Index: AQHcaHd5VbkCKnpsCEiu8/BuhqMfCbUZEqGAgABHdoCAAARegIABSkgAgAATGbA=
Date: Wed, 10 Dec 2025 11:17:12 +0000
Message-ID: <DM8PR11MB56550D69C15FBE13288B2224E0A0A@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20251208191722.7194-1-tursulin@igalia.com>
 <20251208191722.7194-7-tursulin@igalia.com> <aTfxySrZ-O1Bplcm@intel.com>
 <2b912c41-a03a-40cc-8bf0-f70558ffdafc@igalia.com>
 <aTgxZTjU398-jnf3@intel.com>
 <9450ca34-033c-4217-80cb-6f87924f372c@igalia.com>
In-Reply-To: <9450ca34-033c-4217-80cb-6f87924f372c@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|DS0PR11MB6351:EE_
x-ms-office365-filtering-correlation-id: da803586-b78a-4fc4-4589-08de37ddab0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Yittem1mQzhSeGJIcnpQR0l0QUs1dTByUGtmOVloVHZsbW1Hd2dsMGcyaW5Q?=
 =?utf-8?B?cXhxZlAwQ2hWWWdZOW9ldTlaZlNUNXpYYm81N2VERGFQeXh6dnJXMGxuZldH?=
 =?utf-8?B?WStZUmwwbXpPWDdzVERpU3hRRXRuV1dyVlhYK2N6MUQ1ay9zeFpxdDczNWFz?=
 =?utf-8?B?THBmZWtFZEtLOEZSOFdvcnp2WGRETzFxQzA0YzRxZXlHSSs2ZWZUUlVMNUEv?=
 =?utf-8?B?NTgrT1hueURhWDd0M3Z1Z3E3K0lzVisyU25TYnF4cGZxVnZQbE91dDdsV2ZM?=
 =?utf-8?B?Y2JrRG5MK2tiMElTQTR2OEtXOEpLZmkzM1NZZzV6aStxTzZLZ2pmWGp2SEVV?=
 =?utf-8?B?YkQ3WWNEWTM3d0lqNDhKOFhhMlZHTVRqQmVFQTBySE1HaTR2ejR6WFIwSitn?=
 =?utf-8?B?bUFHVEV4MEFxVnp5c0FLeFVqSHB1bzRrSG9IeS9wK1JnNUwxalNFUS82ZDZE?=
 =?utf-8?B?R1lwVlB2YitHc3pFUFJ2WW1hWEMxazAvM29mY3NiQi9yMmtPVHRoSHVnUko4?=
 =?utf-8?B?ZWJPeG9XdEpWbWpKSlJRYlpVelQzVm5sUlpQSllLNHBBWkcvMGwybnM1WW9r?=
 =?utf-8?B?TG9lTmdGTFZVdHV2WmtaSFFKRFh4Z0lKaVpOQ1QwcWVuUzIxSVdKWEgvWkc2?=
 =?utf-8?B?YllZT3UyUk1WNUYzOUw5d1BEQS96aGFpSUhIOFdFTEY5ZHAyK0M5cVhSdTRt?=
 =?utf-8?B?ZHVxeVBQeTUyUS9Bb01kdjlsbXFzMFB3QkppU3IyTEcwakRUNWFpR0k4WTJv?=
 =?utf-8?B?d3lVaG40SUlHSEFNQVJLdTdZY0poZ0pOUFVZb1VwRkJyNzNjZTdIQTF6SDFE?=
 =?utf-8?B?RUwwcm5Hc2ZnS3U5YnEzNTRJQitVbWdIVy9KRjlxaEMxN2xUMzgzZHh1ZHda?=
 =?utf-8?B?eENuTzQ2b0o3SnlYdHBXWWEvNkt4OG9nU1kvYk15VzhiL1dnakJCTEZCMHZI?=
 =?utf-8?B?cXhqdXBBWEFCZ3VJQ2V6TkRXNWwxZ0pFL3RmTFc5ZWw1SzF6SWEwQlVVcGox?=
 =?utf-8?B?cC9sWHNsL2RxNU00OHR6VmRiYmZRdytYMG8xNVFjRHZmbWJ6bmtYdDVRVklk?=
 =?utf-8?B?YXNGYnBCcTg2bXQyVnFUYlZKUkU4QmtTSEV5ZEtuT1lsRUZlUENYQ1BDdStj?=
 =?utf-8?B?UFZmTXRzMkgxcHNDU0JnTXVXd2NEejlvaDREZnFJNnphT2tGbUJkM3FzVDlP?=
 =?utf-8?B?RWV4OGNYSEJKa051V1VSS0JBNXFhR3lxSFBsdEh1dHhlK2hoUDBqRGY3OVhT?=
 =?utf-8?B?QjRZUjkxN0VCZmkyMDNrNzdRMG5SdGdQSDBqZlNVZmVMTEx2bXk1REVyVE9S?=
 =?utf-8?B?RUpCR3MxYUVVY2dJbktkcnQyNFdlK29YS2ZlVTgvZlA3TFlUeXNRTmxQbWRS?=
 =?utf-8?B?UkFLVDBnUG5MajdOZEpGOFhGNnJSdmY0QzE5SGtPQjZtRS9maFpwOEd5dVZY?=
 =?utf-8?B?UjlQTzk1TEpkLzdobmRRZy9aS091QmJYRloyOEx3SXphSVRHUW5sUFBvcEd3?=
 =?utf-8?B?ZHZ1My9acENsK1dkOHN3YWZJVDRwbm1tcjAwa1FwYU1lN084UVVxVE5VSVJF?=
 =?utf-8?B?MmlMUmQ1RkNNNWY5a29ON28xVVQzSEtOaXJsNEZkLzh2M0s1VWxlaUROVEdh?=
 =?utf-8?B?c2dZTEd1eDQ4OStCNldjSGZzc3FyU2xqWEpJU1kvYWEwNVBUUEFJeGRmTnlD?=
 =?utf-8?B?aXM1U1dvN1RVanU5U2dpL1JLZFE3YTlZbDhsaStqeitOVWhadXg0TVdEQUJi?=
 =?utf-8?B?U3QyTlhiMGU5M05mTURBVFFwWnJzMWdHb1BRTXIwTmFDZS9zemR5ODdIUFRn?=
 =?utf-8?B?cVNNTjArWkZLcHNOWEd3YkNJUVYrSHhYSEtVNnhRWVFOLzBDeFhFWG9SZ2Ni?=
 =?utf-8?B?QTljazcvQSsyakpOZVVGVHNTdWNRMEtyeWlkL0xyOElmdFdiWEFZVlJ1dVB3?=
 =?utf-8?B?aXVEdXljNkpvZExQQk4yaGYxVXlGM05jQk1lQWR2VUZvcUI5dWtJOVhaNVM4?=
 =?utf-8?B?YU1rMEF2bEZRYUpJQXVDVXZhR0hpN1B1NGg2T1MwVlhsZElod2FCZGNFYnZD?=
 =?utf-8?Q?ZSUwbi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjM4Y1dlcHlaQ2c3Z0VHTDU4RzBqMDFpb1Y0cUEzcnNvY253OWsxNnp0eTZz?=
 =?utf-8?B?YXk5cWloeHl0VS85RWpmY1FMa2d0VFAxMGZBZU94WTdYY1FpRzcyWmhqRnZ2?=
 =?utf-8?B?V3NzN3dNeGEreXRnaTBPSWs1SlRGeGhTQWQrZkt1ZWZkM1hURWxLRTU0aEJG?=
 =?utf-8?B?YWNWbHZmZFMwVDNBYWtLbzJiYkI2UnhEVnhIQ2JGalk4Tm9zaW4ySE4yaFE1?=
 =?utf-8?B?WWNjdEY5WENWTXRlUkhQK2JOZFF4YXVUbDlLQmhIbEc1Z2VXR1I3Q1BvTTJk?=
 =?utf-8?B?T2o2U3c3T2ZsTGxEUWZsRlJnQWFMN3V4Zk5aVXJRaWNNc2Z0Tk4zbDZXSU5R?=
 =?utf-8?B?eUhUMTJ4ZWZHdS9pRGppQjdWc2p2VDJYWWRDelkzQWdWOVlHMkVLdUxZSDUw?=
 =?utf-8?B?S3RucDJkMGUycnRGVUVtc1MvbDBpN3h5T2dvWHQ2SE1FUDdiYTN6ekgvYisy?=
 =?utf-8?B?TU5SdHg4QWxWd2lWVUlEcFFIK3RjaXE4bTRCL2JGSTdUbVFMVUJXb2tXTDJo?=
 =?utf-8?B?WVY1UEVVckp5NmE0dld0Z0g2TzFWbGw4L04zOFg3ZTJWNUpOdkVtUlNhSlUx?=
 =?utf-8?B?TmgrSkRpcmJXRjlQWmdiYldKWklIM2pnYTM0dVY0cldzYTlhREh0M0h0OGxL?=
 =?utf-8?B?NEZLK1BZTWcydjZBdUxmck9la0VpS3I4Y3d5UmFrSGZKai85VUQzWllmSVNC?=
 =?utf-8?B?Zk5jUC9kL2JyRlY5U2dQTjdzWFNVN2YrZUo5TWxWTkwwalFPNEsrYU5WRFJJ?=
 =?utf-8?B?b3QwVkJ3SGtFL1lUUWlRLyt1TllQT3VGQlRCSjNKZkRnZ0RHTWN6aXpPcnpM?=
 =?utf-8?B?cWpVNzZqZ1hLS3FxTk5tbFR3SDNBNzlkbi8rb1NsV2M3RmpBU2E0SlNveTlD?=
 =?utf-8?B?Zk9zR3NlNGo3ZFZwb1psdzlHZU54YzNQVTJrSU1YblBIekVEZG9ZUG5BbFlB?=
 =?utf-8?B?am56Qnd1cGkySy94TGpaODI5OWtZOEdRTUloRzNsdnFGTS9tWkFSUWRZTVF6?=
 =?utf-8?B?OXlLVmU1UXZGOGxTWkJDRDl4d0N0WHlET2M3QkVVSTFWcHpsK0pTbUVGanFu?=
 =?utf-8?B?TndHNjFLV2xncUNtYkgvTmI0U2NhcisvaUpIMEhEQmxqL3JRTzc1KzVYeGRw?=
 =?utf-8?B?RnVFTlZXLytZb0ZOTlp6ZHp1N3ZhK2pnczNwYmlZTFFsMk9WR3ZFckdQdlNy?=
 =?utf-8?B?ZTBJOHV4blVjMnNxdWx0c2FwYU10bFYybkI5OWtuQ1NYbEtIRnI4MC9uQnhz?=
 =?utf-8?B?YXRhR1BpTXZtWFIyd0FJSXFwN3RhU2NQamF5WXRZUW9XOG1wNDNadyt4cU5D?=
 =?utf-8?B?YWphZ3VUWmtQR2duMHdKTFdiWFdyVnZwUHFDclBoTmdPS2p1OU8zZTlJb0lv?=
 =?utf-8?B?ZW1adFJZaUxiRWc2djhGR0J5b25xSGNIZi9pQkswbFZNUzRxck1KcmpiZDZv?=
 =?utf-8?B?TVMzY3dNRkkxcFpJb1NnWSsvWStZcG1tMk5RWjFrTDQzb0ljaWZXUkViZzJP?=
 =?utf-8?B?WGlaUzRodDZHWlJYbkNVWXE3NG9WVGswTGR5UlorZ09TT0dwalhtNS8reUVK?=
 =?utf-8?B?Skp5SmJleVVrdjhqZy9XVUIxYldqdFN6T2taUXhrNFlxY05sQmtkU0gxM2l5?=
 =?utf-8?B?WVFwU2ZPay9qaFpPVXVGVi9DSlJDMHprNEpmOXBuRExIbk1aSzlSZnRhVS9l?=
 =?utf-8?B?b1A5dHEySTdLZktsVXRtM21seGs3TTNHY3F3bVVNVFIvQ3dMOGJpZm5sazB3?=
 =?utf-8?B?ZW9pcTEvUWZtWXk0akxkdWNrMTUrbERVMHJGN2Fxb2llcHV1YTRudjVtWHht?=
 =?utf-8?B?Nm96V2t6cHR6N0pGQWZmRHlpZmFkanpHbVI1aWtyMVFieEhBaEZWc3BYd1Ry?=
 =?utf-8?B?dFZkVVFxN2NtOVpaU0p5ZWZ1NGtuS0lwMjFiQmNWRzllaUhXbU1MajRUQWFZ?=
 =?utf-8?B?bGNyODg5QXFCbEJ5Vnpna3hVQ1NZZm1GSFZiTy8wUnBwQThadjNGNzRMUlV0?=
 =?utf-8?B?OHVQUk42cWROK09JZWswWjd5NmU3V3c5Qi9VNXBWWk53aDl5WGVJL0RraldG?=
 =?utf-8?B?ckZHZlNYcGhLUVlYMWNxK1NDanJaYzNIT0NMU2RLK0pycEdWZDZya1Z6Vkor?=
 =?utf-8?Q?727hg2jGwToDZVW9bOErGjx1I?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da803586-b78a-4fc4-4589-08de37ddab0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 11:17:12.9685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lSWEQetsBe3HmAXQlGbdMax4Aw9lxO0h3sg2+LgkWUI50sqSP1dPLFEfLAOFg6mD640+zUE9rboofSnRoFWKPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6351
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

SGksIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEludGVsLXhlIDxp
bnRlbC14ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFR2cnRr
bw0KPiBVcnN1bGluDQo+IFNlbnQ6IFdlZG5lc2RheSwgMTAgRGVjZW1iZXIgMjAyNSAxMi4wOA0K
PiBUbzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4g
Q2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsga2VybmVsLWRldkBpZ2FsaWEuY29t
OyBUdnJ0a28gVXJzdWxpbg0KPiA8dHZydGtvLnVyc3VsaW5AaWdhbGlhLmNvbT47IFZpdmksIFJv
ZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjE1
IDA2LzEwXSBkcm0veGU6IEhhbmRsZSBEUFQgaW4gc3lzdGVtIG1lbW9yeQ0KPiANCj4gDQo+IE9u
IDA5LzEyLzIwMjUgMTU6MjUsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToNCj4gPiBPbiBUdWUsIERl
YyAwOSwgMjAyNSBhdCAwMzoxMDowM1BNICswMTAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToNCj4g
Pj4gT24gMDkvMTIvMjAyNSAxMDo1NCwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOg0KPiA+Pj4gT24g
TW9uLCBEZWMgMDgsIDIwMjUgYXQgMDg6MTc6MTdQTSArMDEwMCwgVHZydGtvIFVyc3VsaW4gd3Jv
dGU6DQo+ID4+Pj4gRnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGlnYWxpYS5j
b20+DQo+ID4+Pj4NCj4gPj4+PiBJZiBEUFQgaXMgYWxsb2NhdGVkIGZyb20gc3lzdGVtIG1lbW9y
eSBpdCB3aWxsIGJlIGNyZWF0ZWQgaW4gdGhlDQo+ID4+Pj4gZGVmYXVsdCB3cml0ZS1iYWNrIGNh
Y2hlZCBtb2RlLiBUaGlzIG1lYW5zIHdlIG5lZWQgdG8gZmx1c2ggaXQNCj4gPj4+PiBhZnRlciBw
b3B1bGF0aW5nIG90aGVyd2lzZSBub3RoaW5nIHdvcmtzLg0KPiA+Pj4+DQo+ID4+Pj4gU2lnbmVk
LW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGlnYWxpYS5jb20+DQo+ID4+
Pj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPj4+PiAtLS0N
Cj4gPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYyB8IDQgKysr
Kw0KPiA+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gPj4+Pg0KPiA+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYw0K
PiA+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj4gPj4+PiBp
bmRleCBhMjJhOTE4MmRhZGIuLjg5ZWU2OGM0MDMyOSAxMDA2NDQNCj4gPj4+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYw0KPiA+Pj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS9kaXNwbGF5L3hlX2ZiX3Bpbi5jDQo+ID4+Pj4gQEAgLTMsNiArMyw3IEBADQo+
ID4+Pj4gICAgICogQ29weXJpZ2h0IMKpIDIwMjEgSW50ZWwgQ29ycG9yYXRpb24NCj4gPj4+PiAg
ICAgKi8NCj4gPj4+Pg0KPiA+Pj4+ICsjaW5jbHVkZSA8ZHJtL2RybV9jYWNoZS5oPg0KPiA+Pj4+
ICAgICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9iby5oPg0KPiA+Pj4+DQo+ID4+Pj4gICAgI2luY2x1
ZGUgImk5MTVfdm1hLmgiDQo+ID4+Pj4gQEAgLTE2Miw2ICsxNjMsOSBAQCBzdGF0aWMgaW50IF9f
eGVfcGluX2ZiX3ZtYV9kcHQoY29uc3Qgc3RydWN0DQo+IGludGVsX2ZyYW1lYnVmZmVyICpmYiwN
Cj4gPj4+PiAgICAJCQkJCSAgcm90X2luZm8tPnBsYW5lW2ldLmRzdF9zdHJpZGUpOw0KPiA+Pj4+
ICAgIAl9DQo+ID4+Pj4NCj4gPj4+PiArCWlmICgheGVfYm9faXNfdnJhbShkcHQpICYmICF4ZV9i
b19pc19zdG9sZW4oZHB0KSkNCj4gPj4+PiArCQlkcm1fY2xmbHVzaF92aXJ0X3JhbmdlKGRwdC0+
dm1hcC52YWRkciwgZHB0X3NpemUpOw0KPiA+Pj4gSG93IGlzIGFueXRoaW5nIHdvcmtpbmcgY3Vy
cmVudGx5IGlmIHRoZSBEUFQgaXMgYmVpbmcgY3JlYXRlZCB3aXRoDQo+ID4+PiB0aGUgd3Jvbmcg
Y2FjaGluZyBtb2RlPw0KPiA+PiBJIHN1c3BlY3QgdGhlIHN0b2xlbiBhbGxvY2F0aW9uIG5ldmVy
IGZhaWxzIGluIHByYWN0aWNlIChvciBhbG1vc3QNCj4gPj4gbmV2ZXIsIG9yIGF0IGxlYXN0IG5v
dCBpbiBDSSkuDQo+ID4+PiBTb3VuZHMgbGlrZSBzb21lb25lIHNob3VsZCBmaXggdGhlIERQVCBj
cmVhdGlvbiB0byBjb3JyZWN0bHkgYXNrIGZvcg0KPiA+Pj4gVUMvV0MuIEJ1dCBJIHN1cHBvc2Ug
c29tZW9uZSBzaG91bGQgbWVhc3VyZSBpZiBXQitmbHVzaCBpcyBhY3R1YWxseQ0KPiA+Pj4gZmFz
dGVyLi4uDQo+ID4+IEkgYW0gbm90IHN1cmUgd2hhdCBpcyBkZXNpcmVkIGhlcmUuIFN5c3RlbSBt
ZW1vcnkgYnVmZmVycyBkZWZhdWx0aW5nDQo+ID4+IHRvIGNhY2hlZCBpcyB0aGUgeGUgZGVmYXVs
dCwgc28gc2hvdWxkIERQVCBiZSBhbiBleGNlcHRpb24gSSBkbyBub3Qga25vdy4NCj4gPiBBbnl0
aGluZyBtZWFudCBmb3IgdGhlIGRpc3BsYXkgZW5naW5lIGlzIHN1cHBvc2VkIHRvIGJlIHVuY2Fj
aGVkLg0KPiANCj4gSSBjYW4gYWRkIFhFX0JPX0ZMQUdfU0NBTk9VVCB0byB0aGUgc3lzdGVtIG1l
bW9yeSBidWZmZXIgY3JlYXRpb24gYW5kDQo+IHRoYXQgd291bGQgaGFuZGxlIHRoaXMgYXNwZWN0
LiBBY2NlcHRhYmxlIHRvIHlvdT8NCj4gDQo+ICDCoEJ1dC4uDQo+IA0KPiA+DQo+ID4+IEluIGFu
eSBjYXNlIEF1eENDUyBzZWVtcyB0byBvbmx5IHdvcmsgd2l0aCBEUFQgaW4gc3lzdGVtIG1lbW9y
eSBhbmQNCj4gPj4gdGhpcyBjbGZsdXNoLiBEUFQgaW4gc3RvbGVuIHdpdGggR1RUIGFjY2VzcyBh
bmQgR1RUIGZsdXNoaW5nIChhcyBpOTE1DQo+ID4+IGRvZXMNCj4gPj4gaXQpIGRvZXMgbm90IHNl
ZW0gdG8gd29yayBmb3IgeGUuIEkgZ3Vlc3MgdGhlIGVudGl0eSBkb2luZyB0aGUgRFBUDQo+ID4+
IHJlYWRzIGlzIHNvbWVob3cgc3BlY2lhbCBjb2hlcmVuY3kgd2lzZS4NCj4gPiBTb3VuZHMgbGlr
ZSB0aGVyZSBpcyBzdGlsbCBzb21ldGhpbmcgYnJva2VuIGluIHhlLg0KPiANCj4gLi4uIElzc3Vl
IGlzIHdoZW4geW91IGZvdW5kIHRoZSBtYWdpYyBtb2NzIDYxIHRoZSBDSSBzdGlsbCBzYXcgYSBz
cG9yYWRpYw0KPiBmYWlsdXJlLiAzIG91dCBvZiA0NCBuZXcgdGVzdHMgZmFpbGVkLiBUaGVzZSBz
cG9yYWRpYyBDSSBmYWlscyBJIHdhcyBuZXZlciBhYmxlDQo+IHRvIHJlcHJvZHVjZSBsb2NhbGx5
LiAoSXQgd2FzIGFsd2F5cyBBREwtUCwgYW5kIEkgaGF2ZSBhbiBBREwtUCBhcyB3ZWxsLikNCj4g
DQo+IEFib3ZlIGNvdXBsZWQgd2l0aCB0aGUgZmFjdCBpOTE1IGhhcyB0aGlzIGNsZmx1c2ggb24g
dGhlIGZpcnN0IHBpbiwgSSBhc3N1bWVkDQo+IENDUyBpcyBqdXN0IHNwZWNpYWwgZW5vdWdoIHRo
YXQgaXQgaXMgcmVxdWlyZWQuIEZvciBjZXJ0YWluIHdpdGggaXQgdGhlcmUgYXJlIG5vDQo+IHNw
b3JhZGljIENJIGZhaWxzLg0KPiANCj4gSSBldmVuIHRyaWVkIHJlbW92aW5nIHRoZSBjbGZsdXNo
IGZyb20gaTkxNSBidXQgSSB3YXNuJ3QgYWJsZSB0byByZXBybyBhbnkNCj4gZmFpbHVyZXMgdGhl
cmUuIFRoaXMgbWF5IG1ha2UgaXQgc291bmQgbGlrZSB0aGUgY2xmbHVzaCBpc24ndCByZXF1aXJl
ZCwgYnV0DQo+IGdpdmVuIEkgYW0gbm90IGFibGUgdG8gcmVwcm8gZmFpbHVyZXMgd2l0aCB4ZSBl
aXRoZXIgSSB0aGluayB3ZSBjYW5ub3QgYXNzdW1lDQo+IHRoaXMuDQo+IA0KPiBPbiB0aGUgb3Zl
cmFsbCBBREwgaXMgbm90IGEgc3VwcG9ydGVkIHBsYXRmb3JtIHdpdGggeGUuIFNvIG9uZSBvcHRp
b24gY291bGQNCj4gc2ltcGx5IGJlIHRvIG5vdCBjb21wbGljYXRlIG15IHNlcmllcywgYWxsb3cg
Zm9yIHNwb3JhZGljIENJIGZhaWxzIChyZWNvcmQNCj4gdGhlbSBpbiBDSSBidWcgbG9nIGFzIGV4
cGVjdGVkKSwgYW5kIHJldmlzaXQgdGhlIHRvcGljDQo+ICppZiovKndoZW4qIGEgcHJvYmxlbSBv
dXRzaWRlIG9mIENJIGlzIGZvdW5kLg0KPiANCj4gQWxzbyBhbm5veWluZyBpcyB0aGF0IEFETCBt
YWNoaW5lcyBhcmUgaW4gdGhlIHhlIENJIGFuZCBub3QgaTkxNS4gSWYgdGhleSB3ZXJlDQo+IGlu
IGk5MTUgSSB3b3VsZCBiZSBhYmxlIHRvIGRvIHNvbWUgQ0kgcnVucyB0byBzZWUgaWYgaTkxNSBj
YW4gYmUgbWFkZSB0byBmYWlsDQo+IHNwb3JhZGljYWxseSB3aXRob3V0IHRoZSBpbml0aWFsIGNs
Zmx1c2guDQpUaGVyZSBhcmUgc3lzdGVtcyBpbiBpOTE1IEJBVCBidXQgbm90IGluIHNoYXJkcy4g
UGVyaGFwcyBtb2RpZnkgdGVzdCBsaXN0IChCQVQpIGFuZCB1c2UgdGhhdCBJR1QgZm9yIHlvdXIg
a2VybmVsIGNoYW5nZXM/IA0KDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gVHZydGtvDQo+IA0KPiA+
DQoNCg==

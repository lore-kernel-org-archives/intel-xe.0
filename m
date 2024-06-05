Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205F5C27C52
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 19:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910CA10E38F;
	Wed,  5 Jun 2024 19:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZLKsq5x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D4010E38F
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 19:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717616495; x=1749152495;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WwMMfD1zBtNU8linE/vgfm7ATcOHOJl2ExLVeGA+5ZQ=;
 b=NZLKsq5xYevXABrxJe/56+/3hVr9VaByhxiBeV2A+3yNileQhpNBsBz3
 zC5sIyJA8vZSpYnSQ9BTCe5sYOG+HpTu/RAWOOKHoDwiq24i+CWfxP31m
 5QPukU+CiL5AEKh9vVxx5kmhhSH7NRMHe4sgoTuBx2JLGjdl5FVWSJ7YY
 4anhL8m90eXhQXxqReip4Sfh11odvvdTZ5cCjVQhmO7qkZN3Qh2c3bqqH
 FqHK3q19EmNeLBIvNwt2E/XFUxlbn3YtiW+a3/s9puoUvzmrnHL5r6Fuu
 D04u+bI/ldRi42OqxsWx/OSON74DPhZYHJmZSuaaWHm4xUbTPOsyK94P5 w==;
X-CSE-ConnectionGUID: ILLEqEggSE+pOY8IGmEJMQ==
X-CSE-MsgGUID: 0cH0yhlCSIqQ6nDx4rAVbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="25655223"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="25655223"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 12:41:32 -0700
X-CSE-ConnectionGUID: fIixv6jjQD2I9HAolODNDA==
X-CSE-MsgGUID: rGkQgWTyTWmLAgc3m/LgkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42153946"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 12:41:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 12:41:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 12:41:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 12:41:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 12:41:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6C56iKY+8L2pjPWVBjO2Ds9ui5rXfgBmFfs/SRxYiM7DrZS99S2XLZ1o4569LvTMLBipgZazA0LMyYxoPDc8RRwzmnqplUT5fxM183i2OXVTEuGHTkH8NmdNNtC6IiK1XF0mFR00qGAXRReo3wYjMeesoMxjCp4pHA/k9MuzJl20GuWVrofzedLAoUHHtVT8qdMIUknZBu22f4gVSngXYoUhkrw5GN6mhztvscrQqcWrZR2PNeqUVVfTuJt9iVq15OXU4d90He/umkDvR4oQ2CZqFtbY7bPL4uiOzYrWZI+xqgi2j64j6vVfYwKml8SbPHKj8lpthrS7bHhM6aEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwMMfD1zBtNU8linE/vgfm7ATcOHOJl2ExLVeGA+5ZQ=;
 b=RTlDygfcfHhRu6i8J64+nGYslQYaShPNtt14atrCs9P6qElCwY65o9b6e3QtppRzf8FRZiV/LH5/idGJrz9o5XCu9Kne8JmeTpxsn1S/bNZfLchvvdjOmY03USetyvXrKShvL+b/PWUBvnOfkgqzcHYtlD7WUx0OVm2/mWloyXxkCckVcsSYaLpFXpttdu3YcwXC7OjMaiEosDL0lmNq5onk8cTZQhoYp7ZNJoEUOwj855xjd5VV5loZ65B6QgZo/Vw9jRmdPM1MFQ0YhcvSmhiHULfHBQ8N/yPCOOpmclhTHu8D7mqs8dJfBOQIyg5zfMYuN6lD2x1DHJ412Sq12g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Wed, 5 Jun
 2024 19:41:29 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 19:41:29 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Hajda, Andrzej" <andrzej.hajda@intel.com>
Subject: RE: [PATCH v3 2/2] drm/xe: flush engine buffers before signalling
 user fence on all engines
Thread-Topic: [PATCH v3 2/2] drm/xe: flush engine buffers before signalling
 user fence on all engines
Thread-Index: AQHatxpTkCdJdhIMBUuYCuNqtmL3QLG5kKnQ
Date: Wed, 5 Jun 2024 19:41:28 +0000
Message-ID: <CH0PR11MB54440CB161CF220081722AC5E5F92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240605-fix_user_fence_posted-v3-0-06e7932f784a@intel.com>
 <20240605-fix_user_fence_posted-v3-2-06e7932f784a@intel.com>
In-Reply-To: <20240605-fix_user_fence_posted-v3-2-06e7932f784a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS7PR11MB6197:EE_
x-ms-office365-filtering-correlation-id: 078113b8-2693-412f-b39c-08dc85977e90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?bVZySHhIb0NNdkJMWlZTbDFBbmlVL2o2WThzWTdrM2dQbVA2WnpxTWpJbGVV?=
 =?utf-8?B?aVN3Z0xURU5XejF6RFNQRmk1VmV5dC9RdmprSXpTa0RJc2RFMGo1dWQ2OGVk?=
 =?utf-8?B?Y0Vqb2w2QjNUd0tVNjJyTkR4dHIvSmJ4UWJUdC81RWZlNlpsYy9oWmx1eGxR?=
 =?utf-8?B?ZzlLMVliR2lld0Q2QTc1MTYwa0V3blIveDhyYkJlTVNZUURNblJaNTdZUHhY?=
 =?utf-8?B?WUVLckRCOGp2empZbytsdHl2NHlUMnV3RzcyQmhGTkwvRnlOWk9zRTRqNzdi?=
 =?utf-8?B?Mjh3VWUza1ZLQ0JwSWlGek03bVNlU0ZPYzJPcUZKOWxIM3hqandoZzhabk82?=
 =?utf-8?B?KzBHeEFRd1pRcFgrblFrQXFzQ0ZXcitvNldDODdVNzVITmhNb1IvdWhYRG9h?=
 =?utf-8?B?M0M1cFBqT2c3MnlxUG1jT3BURlhFdTlUaEs4cE1xUlhPc3hXSnQxRFRrV1dO?=
 =?utf-8?B?Q0JpUVV0ZTNiRzVPUzR6U3pkYnpBZWFxOWcwWGwzVjJXMEJHZXVmRmdBR201?=
 =?utf-8?B?aVQxd3psRjd5ZUNhVkFSc3hxUUhBbFRkK3ZMQ3JlUG1qdEk4aGUwMktWaGc4?=
 =?utf-8?B?Mko2TWgrbjUrcTFOOTFKU0l1ay92clVUQ3d2ckxTKzRIY0lna1BUMzhkV0ov?=
 =?utf-8?B?OGxjajV3ZTYrd2tyWk54VHdRVjNvc2NxZU5pWXR1cXFlUTJjSEJSdDV5Ymt4?=
 =?utf-8?B?YUc2TEo1ZktZY1Z1Ukg2QTRXK0N6aE9kdFZpeWNCZFVZcjdwRko0eTZSbCtZ?=
 =?utf-8?B?TFVIOVEybkhVa1VBSzkrNG5aUEY1Nk8rTHpjVVo4NWE2cWtvbFNaY0paaXpY?=
 =?utf-8?B?TFRHMGVnZ3hrVUpIVE9TKy90Wk5CcmZhQU1zaFpRbnBDemtrOW9ZaUhxNTBZ?=
 =?utf-8?B?UGRkSzJFOXNhaWtMcGUvVFRYNlhlM0c3S0NKcjd3QnE2aSsvY1RSMTlEL2pK?=
 =?utf-8?B?eWZGM0tYaGxyZGg3SUN5a1huZHhFVVZhS2VaeFRQd0dCd0IySnAxSGo0VXp4?=
 =?utf-8?B?UFdQR1BjYUtuK3lJWWZWSmphM3hVSzFGSy9kbjQxek5nRngyVlFFRkFrVkVB?=
 =?utf-8?B?ejZiQXJVbGRDSDJHSExrOU1XK1p1R29xV0diSE1OeEdZU1dvcExscmZvbjI0?=
 =?utf-8?B?Vit6TDhDOGJJL1l5TmZBdDZQLys4KytXTFl1U2U2aFYwQ0tPZDRFdzdtMXN6?=
 =?utf-8?B?YXlXNXBBSGZpa3dpMU5XZjJkQ2lWRGZGKzEyMnZWc2lyb3VWM05PNXBrY0JX?=
 =?utf-8?B?YmZrQ1VEYUNnQ2o0cVg5TnE1dzlSSkhYWDJGbUJjZ3Fkcm42Nm5LTlZGVDZK?=
 =?utf-8?B?dC9vbm8vV3NwNXpMbzJpVjQ4NHV4eW4wZjZ2enJ0eGFCbGRMTmxvcWU3T3FV?=
 =?utf-8?B?Rm5XL3MyMG1SUVNNZzdaN1Z3UzFlc29BNWZHdkQxNFBvb2lCRzIxSVZveW1s?=
 =?utf-8?B?K3pRbFQvL3RQQlFpc2NNVEl1UU5EVjFmKzNYc1RRUnZveG9ac3JqblY3OXJo?=
 =?utf-8?B?WXZrTnpaYjdXLzhlRW5pa2xnZWRZb3FkaHNxV01TN3lSRHR2aUM3Q3J5VXRz?=
 =?utf-8?B?UEc2dUUxeEtrOE1uMGpwZGFTWFhJNzV0TlVpOVZsOFpQaHVkMlJMWC9CU0hJ?=
 =?utf-8?B?bGo0bzRDOTgwajVteUFLN0w1ZGU1Z3cxM1A2eDIrN2xlVDBVWGJ1ZUdYMnZO?=
 =?utf-8?B?N0M5RXZ0VXVGblh4dWZPcEN4c3kyQ0l0b0lhTXpTa2dZbjNsOXhKRllQUDJB?=
 =?utf-8?B?VUVNdElGVFpPVWlKYVAwSmo0Z1BIMHQ0dEw5bm41OTVnclJ6TWovVkJ5MW40?=
 =?utf-8?B?N0tWNmZFaXVuZjRrRFhXQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHdWQnZXTDkwTitKY1ZZWkFDUXV6dWgrMnNzV1YweFlWNmh3WkFVVGphUDNS?=
 =?utf-8?B?NnV0WW9yb0pDWE82U0lYNEMvVVVPakpaenhWdjMxa0tjM1pMbUk2elFqYkV5?=
 =?utf-8?B?WUcyc3JrMm5oV3FXY0J4TlhRYjMvRlErMnpoUy96a3JVREQxMm8rMmR2N3NE?=
 =?utf-8?B?OHB5MEE4T01PNm5LZ2wvL04rbXZhcGlNekNNNFdNSTdDL2RxR1c5TUFUWnhV?=
 =?utf-8?B?NmdBdVl1UHA4Q29LSEdVRnVQL1pJUE5Xc0pyWEVJV2E5azkrQ042WGkwc0hm?=
 =?utf-8?B?aHZZQXdqWFpDOVkxdXY2dUhpcmExMlFUVENqWXE0RU1uM1lPVjBSQzZIMk5j?=
 =?utf-8?B?ZndabitVcHJNQTZVQ0cxdVhSeUoyMzQ0YU8xb3RwMjhOUVpFNndydytCNDVk?=
 =?utf-8?B?ZXFsTUVZS0lIMWhJLzJJOU1xaWFHYXB1aWNWY1V5ZmdwUk1odW5ycXp1RGgw?=
 =?utf-8?B?VCtPd3U1Slo2NkJrSU40Y2dHamhQejhKSWFvNXdreE5KYnpldC9zVlptdzNL?=
 =?utf-8?B?dVQ4N0U4b25hR2ZtNk9SZ0FldENsbnJNdk5laGRTbkVJM3lKa1FDTXJKZDlx?=
 =?utf-8?B?akhWNzZoRDlSZWZYUFU2cEc2QlFrVkYzMldDN1dBNm1LSGw4emhjeFhZaDJq?=
 =?utf-8?B?bmwrUERzYzFLK0x2VjlWNHdmYzNtTlZDMnFxMW5nOWJ6V20ydXErNWRLNnFC?=
 =?utf-8?B?MG5veVhzcnBid3ZtWUZKTmFUNzRIZ2gya1pPSFFHUFZ2V1ZTckpEempsV0Qw?=
 =?utf-8?B?MFdlNUZDdGljM1hNS0JhUE9oSXNoL0VzWnVUMFhjQ0RYeGFqQUNvQnZCOEE1?=
 =?utf-8?B?bXNtS1RybmhhL1gxdExsV1A2ODZ4bm9pTGwzM3BtRzZRSnZyMFBVa01FVjhi?=
 =?utf-8?B?N1pjSmlQRWsxUis1WVdxOGFGMDBMS3A2MkhqVWw5WVoycHI0aGdHZmdqL25l?=
 =?utf-8?B?QUZsa0MwZ0VBNkZ2aC9vOW9jdktpejNiWWc1UURHV3ZpcUJBMGhudlNWQjRZ?=
 =?utf-8?B?aERydTJxbnJ5eG0rREt4MUh5eHJKL1dYdzRPRkxkVDRmaEZuZytsTlNWRmJR?=
 =?utf-8?B?d2FIaCs2dzFEWGsvRWNpZzZpWUZyUmdVREU0aGw3VjNpcjFyS2lPVnNvM1ZO?=
 =?utf-8?B?dGpzYUhvdGlwaVAyYkhMVG5rOU9QdVd0SFJpZjVuaXZKRjdBaTY2NHZMZWxv?=
 =?utf-8?B?WmNsVmtVSnBrTlU2SzBvSlNtd1dtUVRIMzYra3l6UmdLRXBSVEZDMHRaaUdU?=
 =?utf-8?B?VWNmYmRJbG9ReW40V1FQZGw3WUo4NEFGQTF6ZmoxVXdCVWRxV2tJOWIxSDJ2?=
 =?utf-8?B?a0ljTWdVTHNLMkhUR0oxTE9LSFNmV1YxV0hFekkvOFVZbWZZbnpaU0VaT2Vw?=
 =?utf-8?B?Qjl1eDBzVmp1WXQ3MFBmRFJZY3A5T1NHS2l5aHg1ekdjcGVGWlRMUkJhc0hM?=
 =?utf-8?B?aHJybFhXOWUvUHkzVjZFNlRGMzdhNHhOUjhzWnR6cVZudWxkay9DMCtLV3Bw?=
 =?utf-8?B?VGtGYnphbVJGMjkyWmZCWHRPaGhIUGx1RHpTVGt4YWd4RjJXZ0NQZitlUXlt?=
 =?utf-8?B?UVk4WFJ2MkNaajF4cU5rZk9sRlRjR0pXaTFWVmVjZDJsZHM3eDV4Q0VIRU5N?=
 =?utf-8?B?WXFTYjUyR0RCc2RvVzlMV0N5L290dm5nZ0NlNEkxTlJtMWVCcnFHZzJrdDht?=
 =?utf-8?B?bTVvcGo3ZmhDWXl6cXMxdDF3aFBGcEhvT3V1elBxelVpMzVOY0pMVzlMMTJS?=
 =?utf-8?B?eldSdWY1YmloWDRkWEJlemw3VU5vOVdRbXNuSXpWRFRLWXhZRXRuQk9JZFZG?=
 =?utf-8?B?Z1NZRE96OFRCNzVTdE0xQ0hvL0g1UXBrZ0N4R1hxcnVscGhuR2U3VjRxTGly?=
 =?utf-8?B?c2VqN2pML1puVmgweG1iQUM1a0FRWWxZbHhOSnZHcFBSc3RnZE8rd1JuOERO?=
 =?utf-8?B?YmZLMzhQQlFTRml5NGlVeHE4Umo2bjBmUUlCeDNLRytFMEU3c00rYWt3d2hY?=
 =?utf-8?B?dCtiVDd4MWh4azdPbllkd0RpbFNYa0poZTFzUVRJcWk0ZzMyMWR1YzI1dWdU?=
 =?utf-8?B?NGdBa2VCSmlBN3hER2NERy9YRHQ5bFNOdzEwWWJYNVpDVXp0RFQ4MHdTQUJa?=
 =?utf-8?Q?zfKJz3bd/YFBC1W2z2Mg3pPIt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078113b8-2693-412f-b39c-08dc85977e90
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 19:41:28.9415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3OPVRCErymo7/KAP45oi86rAySCmtWnMIYynuysTnaxmEaSuvUXRT/iOoK1UcIbE4/gbOeRR1xnF2L1is3FrKcrlCDaURn9WsKs5eJPdqZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6197
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFuZHJ6ZWogSGFqZGENClNl
bnQ6IFdlZG5lc2RheSwgSnVuZSA1LCAyMDI0IDEyOjMwIEFNDQpUbzogaW50ZWwteGVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQpDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21A
bGludXguaW50ZWwuY29tPjsgQnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29t
PjsgRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT47IEF1bGQsIE1hdHRo
ZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+OyBIYWpkYSwgQW5kcnplaiA8YW5kcnplai5oYWpk
YUBpbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggdjMgMi8yXSBkcm0veGU6IGZsdXNoIGVuZ2lu
ZSBidWZmZXJzIGJlZm9yZSBzaWduYWxsaW5nIHVzZXIgZmVuY2Ugb24gYWxsIGVuZ2luZXMNCj4g
DQo+IFRlc3RzIHNob3cgdGhhdCB1c2VyIGZlbmNlIHNpZ25hbGxpbmcgcmVxdWlyZXMga2luZCBv
ZiB3cml0ZSBiYXJyaWVyLA0KPiBvdGhlcndpc2Ugbm90IGFsbCB3cml0ZXMgcGVyZm9ybWVkIGJ5
IHRoZSB3b3JrbG9hZCB3aWxsIGJlIGF2YWlsYWJsZQ0KPiB0byB1c2Vyc3BhY2UuIEl0IGlzIGFs
cmVhZHkgZG9uZSBmb3IgcmVuZGVyIGFuZCBjb21wdXRlLCB3ZSBuZWVkIGl0DQo+IGFsc28gZm9y
IHRoZSByZXN0OiB2aWRlbywgZ3NjLCBjb3B5Lg0KDQpJIHByZXN1bWUgdGhlIG1ldGhvZCB3ZSB1
c2UgdG8gYXBwbHkgYSB3cml0ZSBiYXJyaWVyIHRvIHJlbmRlci1jb21wdXRlDQpjYW5ub3QgYmUg
dHJhbnNmZXJyZWQgb3ZlciAxLXRvLTEgZm9yIHRoZSBvdGhlciBlbmdpbmVzOg0KUmV2aWV3ZWQt
Ynk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCi1Kb25hdGhh
biBDYXZpdHQNCg0KPiANCj4gRml4ZXM6IGRkMDhlYmY2YzM1MiAoImRybS94ZTogSW50cm9kdWNl
IGEgbmV3IERSTSBkcml2ZXIgZm9yIEludGVsIEdQVXMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
emVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFRob21h
cyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYyB8IDE4ICsrKysrKysrKysrKysrKyst
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYw0KPiBpbmRleCBiMTFiM2NkMTZiNWUuLmRiNjMw
ZDI3YmViYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMNCj4gQEAgLTgwLDYgKzgw
LDE2IEBAIHN0YXRpYyBpbnQgZW1pdF9zdG9yZV9pbW1fZ2d0dCh1MzIgYWRkciwgdTMyIHZhbHVl
LCB1MzIgKmR3LCBpbnQgaSkNCj4gIAlyZXR1cm4gaTsNCj4gIH0NCj4gIA0KPiArc3RhdGljIGlu
dCBlbWl0X2ZsdXNoX2R3KHUzMiAqZHcsIGludCBpKQ0KPiArew0KPiArCWR3W2krK10gPSBNSV9G
TFVTSF9EVyB8IE1JX0ZMVVNIX0lNTV9EVzsNCj4gKwlkd1tpKytdID0gMDsNCj4gKwlkd1tpKytd
ID0gMDsNCj4gKwlkd1tpKytdID0gMDsNCj4gKw0KPiArCXJldHVybiBpOw0KPiArfQ0KPiArDQo+
ICBzdGF0aWMgaW50IGVtaXRfZmx1c2hfaW1tX2dndHQodTMyIGFkZHIsIHUzMiB2YWx1ZSwgYm9v
bCBpbnZhbGlkYXRlX3RsYiwNCj4gIAkJCSAgICAgICB1MzIgKmR3LCBpbnQgaSkNCj4gIHsNCj4g
QEAgLTIzNCwxMCArMjQ0LDEyIEBAIHN0YXRpYyB2b2lkIF9fZW1pdF9qb2JfZ2VuMTJfc2ltcGxl
KHN0cnVjdCB4ZV9zY2hlZF9qb2IgKmpvYiwgc3RydWN0IHhlX2xyYyAqbHJjDQo+ICANCj4gIAlp
ID0gZW1pdF9iYl9zdGFydChiYXRjaF9hZGRyLCBwcGd0dF9mbGFnLCBkdywgaSk7DQo+ICANCj4g
LQlpZiAoam9iLT51c2VyX2ZlbmNlLnVzZWQpDQo+ICsJaWYgKGpvYi0+dXNlcl9mZW5jZS51c2Vk
KSB7DQo+ICsJCWkgPSBlbWl0X2ZsdXNoX2R3KGR3LCBpKTsNCj4gIAkJaSA9IGVtaXRfc3RvcmVf
aW1tX3BwZ3R0X3Bvc3RlZChqb2ItPnVzZXJfZmVuY2UuYWRkciwNCj4gIAkJCQkJCWpvYi0+dXNl
cl9mZW5jZS52YWx1ZSwNCj4gIAkJCQkJCWR3LCBpKTsNCj4gKwl9DQo+ICANCj4gIAlpID0gZW1p
dF9mbHVzaF9pbW1fZ2d0dCh4ZV9scmNfc2Vxbm9fZ2d0dF9hZGRyKGxyYyksIHNlcW5vLCBmYWxz
ZSwgZHcsIGkpOw0KPiAgDQo+IEBAIC0yOTMsMTAgKzMwNSwxMiBAQCBzdGF0aWMgdm9pZCBfX2Vt
aXRfam9iX2dlbjEyX3ZpZGVvKHN0cnVjdCB4ZV9zY2hlZF9qb2IgKmpvYiwgc3RydWN0IHhlX2xy
YyAqbHJjLA0KPiAgDQo+ICAJaSA9IGVtaXRfYmJfc3RhcnQoYmF0Y2hfYWRkciwgcHBndHRfZmxh
ZywgZHcsIGkpOw0KPiAgDQo+IC0JaWYgKGpvYi0+dXNlcl9mZW5jZS51c2VkKQ0KPiArCWlmIChq
b2ItPnVzZXJfZmVuY2UudXNlZCkgew0KPiArCQlpID0gZW1pdF9mbHVzaF9kdyhkdywgaSk7DQo+
ICAJCWkgPSBlbWl0X3N0b3JlX2ltbV9wcGd0dF9wb3N0ZWQoam9iLT51c2VyX2ZlbmNlLmFkZHIs
DQo+ICAJCQkJCQlqb2ItPnVzZXJfZmVuY2UudmFsdWUsDQo+ICAJCQkJCQlkdywgaSk7DQo+ICsJ
fQ0KPiAgDQo+ICAJaSA9IGVtaXRfZmx1c2hfaW1tX2dndHQoeGVfbHJjX3NlcW5vX2dndHRfYWRk
cihscmMpLCBzZXFubywgZmFsc2UsIGR3LCBpKTsNCj4gIA0KPiANCj4gLS0gDQo+IDIuMzQuMQ0K
PiANCj4gDQo=

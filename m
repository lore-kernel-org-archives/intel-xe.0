Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B93DCA0EDC
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 14:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D2210E89F;
	Thu, 14 Aug 2025 14:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JDqTPYMo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0343E10E89F
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755183367; x=1786719367;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DWt06XVkRHjfTbTnqhBm60bH94Wz8UfRrLHgQ9rCoso=;
 b=JDqTPYMoOr3KQp33t5lwV7DF+PbDxDAXjEfGkwPZlWpscEhEP5C0jYk2
 w0rG33kcgrIG8kSaHzMO5cap0X9KqAAghBH640jxCa4d4z1rrZvdDF8fX
 LDUG5hAAl1CMb3T1FXK91VGhcU1SquoDoaPq9HSCO382ItTobSqBjXBjI
 T/W5aUvvH4HYR8H1oplEy1qifpqNoONmhJfrlWDAT6xPaKL3rvWiv/DYP
 0pW9R7G4yt5F6lopzzjgrlXuhqFt0c4pWgHN+TiaAFJKffDgupLRMswyh
 bS9sQk+hC1rI9v89bKnUgXoFrZq5x+AfQFUBT9eur7LytNQKBgLKH7aZc Q==;
X-CSE-ConnectionGUID: uv37JYCRR/mJoYnTr4U+TQ==
X-CSE-MsgGUID: 335UlecHSS2MEtexZeX2BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="45076930"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="45076930"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 07:56:06 -0700
X-CSE-ConnectionGUID: tsZtU/C0TfWI3GgRDABTEQ==
X-CSE-MsgGUID: E6LIwEbLQL6d8gQ+/YP1OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="190470118"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 07:56:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 07:56:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 07:56:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.68)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 07:56:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiuQqPyEIbv6LlsoS4m+l3elRNZa1faw4MLJ4p3nFAAa66WWb9CTrnCU8czDXmLGmgvo694oT3HMabDUuXZws8LURJtS+qotXdSTqOytDBCgYLjEvBgFLGs5rL5DFQragRVq2ofvz4p/2m03wTKVbJUkT3hiCMMKDf0xICzWGW2u+hDukfSo9RM79jDbH2vzK5E2H9RE32JoHxuq1G1Ey3+X0OTjVqop1gK9qT61YNfL9hHEt5aX1Aewwd/EJyxgnYitykeHxO21IXIrsUgqg3XVmhVm9AAFb7fqZY136eFuAiR+Osgq/6c2nO9FHOsXqPzZ8rOWbW5X67hQr1Jyew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWt06XVkRHjfTbTnqhBm60bH94Wz8UfRrLHgQ9rCoso=;
 b=skYVF7auWL23RBIGs2E3471wlXAt4MjNM5m41/HC/8nFIfiH/nuy2OukZeCCsDWegeyFW/AuD1xGGM8rUNOKkTK6zPQ06f6y+1ZGuQKyLQ7lnmaSc2XUveEVNyojoDKP3MfehnpfntRskvgDxIMAKn3uQNreT4Ur/JZy6xOU755dxXcFG2i+akYX9aZVnj3ICwCH7YxYhZapapkHvb4fzhSgqvvnLTm7koiBWDl2zG+qTgGFyCvdX6yExIZWerBqJsJqfuCEUpy0h5kM9A756T3cttG5pVf9lQ7afw8ARXQy1Ss7o1RBfGcQpcBCHEhgfsGFM/FQDNVXLm+bNtuuDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH0PR11MB7522.namprd11.prod.outlook.com (2603:10b6:510:289::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.17; Thu, 14 Aug 2025 14:56:02 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 14:56:02 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/migrate: make MI_TLB_INVALIDATE conditional
Thread-Topic: [PATCH v2] drm/xe/migrate: make MI_TLB_INVALIDATE conditional
Thread-Index: AQHcCFRWU5ZLqle8DEuav0wUr+DqQ7RY+86AgAk74QCAAA7AAA==
Date: Thu, 14 Aug 2025 14:56:02 +0000
Message-ID: <e3d0aee7bf789cc894a652bf0961b28d538aa166.camel@intel.com>
References: <20250808110452.467513-2-matthew.auld@intel.com>
 <791aec1f4149ab370cc09a4152e4ab5d29a8b673.camel@intel.com>
 <98ec41d9-9410-41f4-b922-f985cbadd000@intel.com>
In-Reply-To: <98ec41d9-9410-41f4-b922-f985cbadd000@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH0PR11MB7522:EE_
x-ms-office365-filtering-correlation-id: bc52d48f-a1d8-4011-7702-08dddb42afdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q0RkUUl0UlNEOUVWK0tieUo1QW1Id2dVRU5VTWROSFFOUTF2amVzdzgxRXdv?=
 =?utf-8?B?U1NYRytNM2tQdkZFakcyMjZtMXJRWlBLL29LaFpUU1EzSW4wUXYwYmhCT0w5?=
 =?utf-8?B?UlZLQUI1eUptNnVHN2xodHNNakxxNjVXdWNLNitSOWg3WEdwTVVTbElRY01V?=
 =?utf-8?B?dm1laGJQeVIvQ3Q2ZmQwV0ZacnYvTlJRZTlOQnYxdzB3WGYwYVlJNWRQSXA4?=
 =?utf-8?B?cVZibXF2NnJ3eDVUNlhiTjFsbEt1b3ZXMTFhNVRjT1hkZXNlYW5MaUpLQkR5?=
 =?utf-8?B?TEtyVGhlTnRNM0h1WDkwU2dyYVl5dERBbDB6WUhpYm44Y0xCYTlvU2I5MU0w?=
 =?utf-8?B?V2ZIYjlyeGlXcDRpbjBPK1EvQVRpeVFaUWw0TFdleGc1eHkweit2ZlA0ZkVL?=
 =?utf-8?B?KzZ5WnpDQm1LZDNzbUpFOC9vWm0wK2xWQXFRZWphZVFGTWNwTEwzS3JRbVJV?=
 =?utf-8?B?WFg3WjVQWGtmYmhYdjNjaHRxNUxFbVNaK3RzbkFKUmlkanFNNFdPUndxMUt4?=
 =?utf-8?B?QllNK1pCSDR6ZXp2SzhiblR1TnhPK3BBZUNGNytBS1Jaa2k2Lytxc3J4S1hy?=
 =?utf-8?B?MXFtb0ZRK0g2S0hSRmVJcXVLd2FoSlJwZFZoZDQ0LzJ6ajNQdklpKzgvVFBG?=
 =?utf-8?B?a3lPenVvMWdMVVlPRWhPckhFNVRlQ3JzZ3FOSjZqTk1ZbVZMNTVkcTVIUkI1?=
 =?utf-8?B?OVExeUlFWkEyWks4ZTZOT0lzcVJkb2VsbmFhWGRHS3NYQlpiMUl5dkswdzRV?=
 =?utf-8?B?dU1MWkgreXpTK0E3WEV6cHdaMkNhZEtxMkNDcDdjemhCa1EzOUIwNUhna0RG?=
 =?utf-8?B?THFEbnFCTHFLWkMxYU4wajliQTJKNXAweDljTGJLekVWUFFuZkptTEt0YSt1?=
 =?utf-8?B?T01meXFYbzBSQjF1NWZjb25QSDJtbFRxK2xTNXJ0eTBGR2QxUUtjMEpXekJ5?=
 =?utf-8?B?azZ4SXRKWHpiYmJiSzBxc1ZQNHFVbXNKUGtOeHRNSjVmNUZ2WkpPaHlabytw?=
 =?utf-8?B?Z2R3QnlnN2I5N1E5NGVkMWRabi9IY1dITGJoQWZhUlJLdlJsbTd1UHhRN2hz?=
 =?utf-8?B?LzRFcFc2NXQzMjlMbFRrK2F2NmtaVHh6YTFOcFNBbkRyUTdnT0tJWGROTHQv?=
 =?utf-8?B?cG5DZ0E4U2c3dzdSaEduYTEwZHFxc1NvVGhqak54MVZWNnJrRXFraENRc0lt?=
 =?utf-8?B?c3RFSy9tNkR1L0JzUGRsa2p2cFNXNmJVN1EwS3MvVnhzR2tIZGNJa24zRVEv?=
 =?utf-8?B?aEY4VVRuWWdsVlhpWk1OUTRjNjZ2NGFxR250aUZuTXI4Ynd2bmVldTAxS2tP?=
 =?utf-8?B?U2tBNXZVY0lkNkRaYVBCMlBDbURiWlhtc01IQzVmbUFzbFgxRVlLbWF4ZS9K?=
 =?utf-8?B?VlBiakxPa3ZRZW93Z0JVTlFhTUlsaTY0b3ZwcEZDQnp3eWJ1RmxkSzBYUzFD?=
 =?utf-8?B?S3BoRkpoRGlqYnVtT2R1cmpZd3k3dUp6Vm9GMUVaOXV5VEt5N0pyaGRuaUJu?=
 =?utf-8?B?WUxBUXQrMXFOVmh6KzhjMWd1OURONzZmMjlxTkpSZlMzU0JVTHkwUEtzY2ht?=
 =?utf-8?B?MkU5emtZc2pDMXBsSksrYlc5dHlLQlRGbVY0NWpDS0JVVTV0N2lad1RxVThV?=
 =?utf-8?B?NUQ1dnVIRm92c0k1cWU4NlhydWJZR0tPY1VhT2ZuSGJRTnJUV2dBalMwTnhU?=
 =?utf-8?B?VWgwSzV5YmtnMGNKNk1sN3dhZXRlZVZDY2tMZVRDTUw0Tlo5cnczRUpoR2dT?=
 =?utf-8?B?cDUxNG4rV1BVcVg5V1JPZ1VoT3ZvcW5wR2t1WW54VWk1MGZjeGN0TEE2VHRt?=
 =?utf-8?B?M3dPR1puRzF4VGJTT01nL1A0NXZLMnpmalZtQzljN3djWXU4WDIySzJnNUFJ?=
 =?utf-8?B?VUh2Uk1DelVNdUtyc2hmaGtEaGpPdW83TXQ3NWY3Z0JUQ2k5cWtRSkFHalNK?=
 =?utf-8?B?Z1RZTFA0bVlIeGhaeklpZGdkb09lUlNVdFM2cDBRVWxoRGlNTHZDZ0cvT1dR?=
 =?utf-8?Q?914wu4cb5K+I+MDRBTb9XwEdydKbHI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mk4wZkF0N3RVSmpWYkQ4ajhIUjNLaFZHZWU3TlNJZTJua3JoeVNUUDJDWkp1?=
 =?utf-8?B?S0RJVEtuZUNvenhwdjVSd05wbm1CeGVkN0N4UzY5WDNmUTdqZTN5QVcvWDl0?=
 =?utf-8?B?R1FiTERKRnoxMUhBMi83c0VZV0E4UkFIS2xkTUd6TlpYSTkwQjVqTm1UN3c2?=
 =?utf-8?B?akk5UFNXLzIrbGxuMExXaUdHNHJBUS9hTUtIZlMzZjJ1c1N1ZllnU2VrdHNL?=
 =?utf-8?B?blZDUzN3cXJGdjhybks4Z1g0QnczZEhvcHNVa2pxOXRwUXdQREJDK2JtVExN?=
 =?utf-8?B?MHdiVjVyS2o5WmhITUs4d1NJdzJzRHJoTzkyUlFJWjdyV0VJSS90Wjd6aW5t?=
 =?utf-8?B?QTZld3FuUVlhUDF4R0x3KzNvYVNRbkFCeDJJMFdCdlI1UUdXNkVyZTB2SjFL?=
 =?utf-8?B?ZVV6U1dkTWZJVzhLS0cxVlBKUkg1SzJ3L0tpMTlPYjR1UEVxdmJoU1ZvUysz?=
 =?utf-8?B?L01WTGtiMmxibVQ0MGhDNUVkdUx5VG9pdENTNjY1czA3cjZvZzBmVWtReUph?=
 =?utf-8?B?U3R0cFFpd0huTXBZVmdoM0VveE85RHVoV2RXcVR2VFl2L3hWY0hiQlpuVlA5?=
 =?utf-8?B?N3NWMStkaXBuQVVsLzhOZElpVmpCUG1DSjRxcnNCWFhBYlhqbGpyZitmYWo5?=
 =?utf-8?B?NktvTWlPMWxDODRmT1NiTHE0NS9RL29uSHZXc2s2NkYydmZIckxJVDVZTllG?=
 =?utf-8?B?UUxWZ3c4dGRSOVh0T1BCUmozaTg0RWhjNmsvZzNnWGp4TmgzTDh2a0ZjUG5v?=
 =?utf-8?B?VGxXSnpBeCsxQVRtK3dLalhNN2tVb3ZYN2tEUUl4QmxLTTA1NjAzUW5HREw1?=
 =?utf-8?B?ckFmTVNBNmpnSFBleGZZcmRzcVVOQmtHRW5ac2FVbXl4am5LMURlcHIxSGI1?=
 =?utf-8?B?TFhQWGlmOFVkOHN3Y2tPRktJeTlhbElVNWw3QXo4RnVNT1E5RW9OVGRqT3hj?=
 =?utf-8?B?T21YUDl4UWJadllGTldmT0tJRkViVTJ2bkQ1WEo0QjcxRVVwVWExd3oxSG9G?=
 =?utf-8?B?R2xpUnByTkFlbEtEeU9MT1NGcjNySGFONFU4ODNVempueXFQZlpDVEs0ZzJt?=
 =?utf-8?B?bmJMbkJtWE83c0VzaWxhRGxMYkRCdjhOR0RwQm1lYkRCNzkrbzRJOGtDeEsz?=
 =?utf-8?B?WnoxME45NS9kSXExQzNSMFU0aWFsNEtnZE5ZU3dMbFNYWkhjclNMcVRoOGh2?=
 =?utf-8?B?TWExV25IMm9lTjJ2N3J5MEF3MVRMa2RuUm9kaTZuRllJM1piVVlObUN3QVZh?=
 =?utf-8?B?WXp0c2dwZ2pGOU0wSlV0WXQxSjNTTnB2WEtUZnFNNEtBeDlrTFdJMkliTS9s?=
 =?utf-8?B?bzZqT2RvUXB5R05FaG5HSnJ5NVZiNlpkb3orZG0wVllpQVh4Y1hmdi9vbzEx?=
 =?utf-8?B?YmQyZDVnSjdPSm1TUElJQ2RJZG12NnlxL3hTalNUQzZuTGFWU3diVVBwZ3RO?=
 =?utf-8?B?SFV2Y3IzQmtoSGJQaVdibDkzVk1lOFNaYzZSQTBwREhkeHJTdnZzbktrUlFL?=
 =?utf-8?B?WFJpT1p4Z1VBeWdqV2d5VGxaM2JDQnp1OEFtWWpYSlFwTEoyRWVPOWZCeFd6?=
 =?utf-8?B?TW9LUThTeXFoU1VzY004dUhyaFYxRklPVWtHbWE3ZnNXaE9yY1BlVW8xbmhS?=
 =?utf-8?B?LzRJZTRvWTJDNWh6MVBBQUN6QjZXRXVWWUtLMThMNkVTaDA3UC9CdmNBK05z?=
 =?utf-8?B?aGV2SFpLd0tXTFl0b1ZEQVRoMjBrdy9YNldtNGRrdlYyekpoelBmVTRvQXRY?=
 =?utf-8?B?MUR6RmJmNmlUb2lXVm5FcGI0UFVyQXcrNkdnZXJrOU9hSjNzbmVxaDNWTFdy?=
 =?utf-8?B?cS9kWkt2OE8zWjMzVTM3d2w5Y1hoUFQ3ZndWeEI0M1NZWnlzTmFoQ1Nzalps?=
 =?utf-8?B?bWM0dU95NVBHdnVDbDd1cTNBelhXNGJ1Wit6dnZxbGhHSzZnMW9tc291RzZp?=
 =?utf-8?B?YUR2UDRFMGljUlE3aEI3eVVnU0pjNlFLYjBBQ2Y1RUJKQ2x1SG81RGM4SjdX?=
 =?utf-8?B?ZXhKNUpBLzdvZGVtZ29talVXTUtGeG1nblNoQ0dPTzBoSDBhbERabDU2RHBz?=
 =?utf-8?B?NjZqSy9qUFRhM1d2eUF1L0dLSkc4OHR0c0NLWXZ2amh1c3BQci9BTk8xZ0Zl?=
 =?utf-8?B?UDRWSDh1T0poNGh2NkxhaWhuUjFlemVTM3ByRitraUpkSlRLaEZXNjFiWGJH?=
 =?utf-8?B?VUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D521D183C22B8B4E93E9331FDD8A6447@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc52d48f-a1d8-4011-7702-08dddb42afdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 14:56:02.0940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 62Dpt3qUprqSpEkyqBWmGBOqK//UtnV+6i5NSQ7Uo3RulMGVzMg3qU8pDuD+lKsdE2tt48qWpt2SKgLKyAfxi0H/gbaTqNPYquIv82JzvvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7522
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

T24gVGh1LCAyMDI1LTA4LTE0IGF0IDE1OjAzICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6Cj4g
T24gMDgvMDgvMjAyNSAxODowMiwgU3VtbWVycywgU3R1YXJ0IHdyb3RlOgo+ID4gT24gRnJpLCAy
MDI1LTA4LTA4IGF0IDEyOjA0ICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6Cj4gPiA+IFdoZW4g
Y2xlYXJpbmcgVlJBTSB3ZSBzaG91bGQgYmUgYWJsZSB0byBza2lwIGludmFsaWRhdGluZyB0aGUK
PiA+ID4gVExCcyBpZgo+ID4gPiB3ZQo+ID4gPiBhcmUgb25seSB1c2luZyB0aGUgaWRlbnRpdHkg
bWFwIHRvIGFjY2VzcyBWUkFNICh3aGljaCBpcyB0aGUKPiA+ID4gY29tbW9uCj4gPiA+IGNhc2Up
LCBzaW5jZSBubyBtb2RpZmljYXRpb25zIGFyZSBtYWRlIHRvIFBURXMgb24gdGhlIGZseS4gQWxz
bwo+ID4gPiBzaW5jZQo+ID4gPiB3ZQo+ID4gPiB1c2UgaHVnZSAxRyBlbnRyaWVzIHdpdGhpbiB0
aGUgaWRlbnRpdHkgbWFwLCB0aGVyZSBzaG91bGQgYmUgYQo+ID4gPiBwcmV0dHkKPiA+ID4gZGVj
ZW50IGNoYW5jZSB0aGF0IHRoZSBuZXh0IHBhY2tldChzKSAoaWYgYWxzbyBjbGVhcnMpIGNhbiBh
dm9pZAo+ID4gPiBhCj4gPiA+IHRyZWUKPiA+ID4gd2FsayBpZiB3ZSBkb24ndCBzaG9vdCBkb3du
IHRoZSBUTEJzLCBsaWtlIGlmIHdlIGhhdmUgdG8gcHJvY2Vzcwo+ID4gPiBhCj4gPiA+IGxvbmcK
PiA+ID4gc3RyZWFtIG9mIGNsZWFycy4KPiA+ID4gCj4gPiA+IEZvciBub3JtYWwgbW92ZXMvY29w
aWVzLCB3ZSB1c3VhbGx5IGFsd2F5cyBlbmQgdXAgd2l0aCB0aGUgc3JjIG9yCj4gPiA+IGRzdAo+
ID4gPiBiZWluZyBzeXN0ZW0gbWVtb3J5LCBtZWFuaW5nIHdlIGNhbid0IG9ubHkgcmVseSBvbiB0
aGUgaWRlbnRpdHkKPiA+ID4gbWFwCj4gPiA+IGFuZAo+ID4gPiB3aWxsIGFsc28gbmVlZCB0byBl
bWl0IFBURXMgYW5kIHNvIHdpbGwgYWx3YXlzIHJlcXVpcmUgYSBUTEIKPiA+ID4gZmx1c2guCj4g
PiAKPiA+IEhleSBNYXR0LAo+ID4gCj4gPiBEZWZpbml0ZWx5IGxvb2tzIGxpa2UgYSBnb29kLCBp
bnRlcmVzdGluZyBjaGFuZ2UuIEknbSBydW5uaW5nIGEgZmV3Cj4gPiBsb2NhbCB0ZXN0cy4gQ2Fu
IHdlIGhvbGQgb24gdGhpcyBtZXJnZSBmb3IgYSBmZXcgaG91cnM/IEknbGwgcmVwb3J0Cj4gPiBi
YWNrIGFzIHNvb24gYXMgSSBoYXZlIHRoYXQuCj4gCj4gU2hvdWxkIEkgYmUgd29ycmllZCBoZXJl
PyBJIGRpZG4ndCBzZWUgYSBmb2xsb3cgdXAgOikKCkhleSBNYXR0LAoKVGhhbmtzIGZvciB0aGUg
Zm9sbG93IHVwIGFuZCBzb3JyeSBJJ20ganVzdCBnZXR0aW5nIGJhY2suIE5vIEkgaGF2ZW4ndApi
ZWVuIGFibGUgdG8gZ2V0IHRoaXMgdGVzdGluZyBkb25lIGFzIEkgcmFuIGludG8gc29tZSB1bnJl
bGF0ZWQgaXNzdWVzCnRoYXQgcHJldmVudGVkIHRoZSB0ZXN0aW5nIEkgd2FzIHRyeWluZyB0byBk
by4gUGxlYXNlIHByb2NlZWQgaGVyZS4KClRoYW5rcywKU3R1YXJ0Cgo+IAo+ID4gCj4gPiBUaGFu
a3MsCj4gPiBTdHVhcnQKPiA+IAo+ID4gPiAKPiA+ID4gdjI6Cj4gPiA+IMKgwqAgLSBVcGRhdGUg
Y29tbWl0IHRvIGV4cGxhaW4gdGhlIHNpdHVhdGlvbiBmb3Igbm9ybWFsIGNvcGllcwo+ID4gPiAo
TWF0dCBCKQo+ID4gPiDCoMKgIC0gUmViYXNlIG9uIGxhdGVzdCBjaGFuZ2VzCj4gPiA+IAo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+Cj4g
PiA+IENjOiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkgPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRl
bC5jb20+Cj4gPiA+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51
eC5pbnRlbC5jb20+Cj4gPiA+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVs
LmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50
ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gwqDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRl
LmPCoCB8IDE4ICsrKysrKysrKysrLS0tLS0tLQo+ID4gPiDCoMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3Jpbmdfb3BzLmMgfCAxMCArKysrKy0tLS0tCj4gPiA+IMKgwqAyIGZpbGVzIGNoYW5nZWQs
IDE2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMKPiA+ID4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbWlncmF0ZS5jCj4gPiA+IGluZGV4IDRlZmZlMTBkODE1Yi4uMzU2MDk3ZmQ2ZDJh
IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jCj4gPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMKPiA+ID4gQEAgLTkwNiw3ICs5
MDYsNyBAQCBzdHJ1Y3QgZG1hX2ZlbmNlICp4ZV9taWdyYXRlX2NvcHkoc3RydWN0Cj4gPiA+IHhl
X21pZ3JhdGUgKm0sCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZ290byBlcnI7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB9Cj4gPiA+IMKgIAo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVf
c2NoZWRfam9iX2FkZF9taWdyYXRlX2ZsdXNoKGpvYiwgZmx1c2hfZmxhZ3MpOwo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfc2NoZWRfam9iX2FkZF9taWdyYXRlX2ZsdXNo
KGpvYiwgZmx1c2hfZmxhZ3MgfAo+ID4gPiBNSV9JTlZBTElEQVRFX1RMQik7Cj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIWZlbmNlKSB7Cj4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVfc2NoZWRf
am9iX2FkZF9kZXBzKGpvYiwgc3JjX2JvLQo+ID4gPiA+IHR0bS5iYXNlLnJlc3YsCj4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAKPiA+ID4gRE1BX1JF
U1ZfVVNBR0VfQk9PS0tFRVApOwo+ID4gPiBAQCAtMTI4NywxMSArMTI4NywxMyBAQCBzdHJ1Y3Qg
ZG1hX2ZlbmNlICp4ZV9taWdyYXRlX2NsZWFyKHN0cnVjdAo+ID4gPiB4ZV9taWdyYXRlICptLAo+
ID4gPiDCoCAKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNpemUgLT0g
Y2xlYXJfTDA7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBQcmVl
bXB0aW9uIGlzIGVuYWJsZWQgYWdhaW4gYnkgdGhlIHJpbmcgb3BzLgo+ID4gPiAqLwo+ID4gPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGNsZWFyX3ZyYW0gJiYKPiA+ID4geGVf
bWlncmF0ZV9hbGxvd19pZGVudGl0eShjbGVhcl9MMCwKPiA+ID4gJnNyY19pdCkpCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoY2xlYXJfdnJhbSAmJgo+ID4gPiB4ZV9t
aWdyYXRlX2FsbG93X2lkZW50aXR5KGNsZWFyX0wwLAo+ID4gPiAmc3JjX2l0KSkgewo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3Jlc19u
ZXh0KCZzcmNfaXQsIGNsZWFyX0wwKTsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGVsc2UKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBlbWl0X3B0ZShtLCBiYiwgY2xlYXJfTDBfcHQsIGNsZWFyX3ZyYW0sCj4gPiA+IGNsZWFy
X29ubHlfc3lzdGVtX2NjcywKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZzcmNfaXQsIGNsZWFyX0wwLCBkc3QpOwo+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlbWl0X3B0ZShtLCBiYiwg
Y2xlYXJfTDBfcHQsIGNsZWFyX3ZyYW0sCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbGVhcl9vbmx5X3N5c3RlbV9j
Y3MsICZzcmNfaXQsCj4gPiA+IGNsZWFyX0wwLCBkc3QpOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZsdXNoX2ZsYWdzIHw9IE1JX0lOVkFMSURB
VEVfVExCOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gPiDCoCAK
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJiLT5jc1tiYi0+bGVuKytd
ID0gTUlfQkFUQ0hfQlVGRkVSX0VORDsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHVwZGF0ZV9pZHggPSBiYi0+bGVuOwo+ID4gPiBAQCAtMTMwMiw3ICsxMzA0LDcgQEAg
c3RydWN0IGRtYV9mZW5jZSAqeGVfbWlncmF0ZV9jbGVhcihzdHJ1Y3QKPiA+ID4geGVfbWlncmF0
ZSAqbSwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICh4ZV9taWdy
YXRlX25lZWRzX2Njc19lbWl0KHhlKSkgewo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVtaXRfY29weV9jY3MoZ3QsIGJiLCBjbGVhcl9MMF9v
ZnMsCj4gPiA+IHRydWUsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbS0+Y2xlYXJlZF9tZW1f
b2ZzLCBmYWxzZSwKPiA+ID4gY2xlYXJfTDApOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZsdXNoX2ZsYWdzID0gTUlfRkxVU0hfRFdfQ0NTOwo+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZsdXNo
X2ZsYWdzIHw9IE1JX0ZMVVNIX0RXX0NDUzsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoH0KPiA+ID4gwqAgCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBqb2IgPSB4ZV9iYl9jcmVhdGVfbWlncmF0aW9uX2pvYihtLT5xLCBiYiwKPiA+ID4gQEAg
LTE2MzcsNiArMTYzOSw4IEBAIF9feGVfbWlncmF0ZV91cGRhdGVfcGd0YWJsZXMoc3RydWN0Cj4g
PiA+IHhlX21pZ3JhdGUKPiA+ID4gKm0sCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBnb3RvIGVycl9zYTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gPiDCoCAK
PiA+ID4gK8KgwqDCoMKgwqDCoMKgeGVfc2NoZWRfam9iX2FkZF9taWdyYXRlX2ZsdXNoKGpvYiwg
TUlfSU5WQUxJREFURV9UTEIpOwo+ID4gPiArCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoGlmIChv
cHMtPnByZV9jb21taXQpIHsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHB0X3VwZGF0ZS0+am9iID0gam9iOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZXJyID0gb3BzLT5wcmVfY29tbWl0KHB0X3VwZGF0ZSk7Cj4gPiA+IEBAIC0xODYyLDcg
KzE4NjYsNyBAQCBzdGF0aWMgc3RydWN0IGRtYV9mZW5jZQo+ID4gPiAqeGVfbWlncmF0ZV92cmFt
KHN0cnVjdAo+ID4gPiB4ZV9taWdyYXRlICptLAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZ290byBlcnI7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+ID4gwqAg
Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoHhlX3NjaGVkX2pvYl9hZGRfbWlncmF0ZV9mbHVzaChqb2Is
IDApOwo+ID4gPiArwqDCoMKgwqDCoMKgwqB4ZV9zY2hlZF9qb2JfYWRkX21pZ3JhdGVfZmx1c2go
am9iLCBNSV9JTlZBTElEQVRFX1RMQik7Cj4gPiA+IMKgIAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
wqBtdXRleF9sb2NrKCZtLT5qb2JfbXV0ZXgpOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9z
Y2hlZF9qb2JfYXJtKGpvYik7Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcmluZ19vcHMuYwo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jCj4g
PiA+IGluZGV4IGU4ZjIyZWM1ZjlhZi4uODBkZmZjM2JhMDM2IDEwMDY0NAo+ID4gPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfcmluZ19vcHMuYwo+ID4gPiBAQCAtMTEwLDEwICsxMTAsMTAgQEAgc3RhdGljIGlu
dCBlbWl0X2JiX3N0YXJ0KHU2NCBiYXRjaF9hZGRyLAo+ID4gPiB1MzIKPiA+ID4gcHBndHRfZmxh
ZywgdTMyICpkdywgaW50IGkpCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBpOwo+ID4g
PiDCoMKgfQo+ID4gPiDCoCAKPiA+ID4gLXN0YXRpYyBpbnQgZW1pdF9mbHVzaF9pbnZhbGlkYXRl
KHUzMiBhZGRyLCB1MzIgdmFsLCB1MzIgKmR3LCBpbnQKPiA+ID4gaSkKPiA+ID4gK3N0YXRpYyBp
bnQgZW1pdF9mbHVzaF9pbnZhbGlkYXRlKHUzMiBhZGRyLCB1MzIgdmFsLCB1MzIKPiA+ID4gZmx1
c2hfZmxhZ3MsCj4gPiA+IHUzMiAqZHcsIGludCBpKQo+ID4gPiDCoMKgewo+ID4gPiAtwqDCoMKg
wqDCoMKgwqBkd1tpKytdID0gTUlfRkxVU0hfRFcgfCBNSV9JTlZBTElEQVRFX1RMQiB8Cj4gPiA+
IE1JX0ZMVVNIX0RXX09QX1NUT1JFRFcgfAo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgTUlfRkxVU0hfSU1NX0RXOwo+ID4gPiArwqDCoMKgwqDCoMKgwqBkd1tpKytdID0g
TUlfRkxVU0hfRFcgfCBNSV9GTFVTSF9EV19PUF9TVE9SRURXIHwKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIE1JX0ZMVVNIX0lNTV9EVyB8IChmbHVzaF9mbGFncyAmCj4g
PiA+IE1JX0lOVkFMSURBVEVfVExCKQo+ID4gPiA/OiAwOwo+ID4gPiDCoCAKPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgZHdbaSsrXSA9IGFkZHIgfCBNSV9GTFVTSF9EV19VU0VfR1RUOwo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgwqBkd1tpKytdID0gMDsKPiA+ID4gQEAgLTQxMCwxMyArNDEwLDEzIEBA
IHN0YXRpYyB2b2lkIGVtaXRfbWlncmF0aW9uX2pvYl9nZW4xMihzdHJ1Y3QKPiA+ID4geGVfc2No
ZWRfam9iICpqb2IsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoGkgPSBlbWl0X2JiX3N0YXJ0KGpv
Yi0+cHRyc1swXS5iYXRjaF9hZGRyLCBCSVQoOCksIGR3LAo+ID4gPiBpKTsKPiA+ID4gwqAgCj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoGR3W2krK10gPSBwcmVwYXJzZXJfZGlzYWJsZSh0cnVlKTsK
PiA+ID4gLcKgwqDCoMKgwqDCoMKgaSA9IGVtaXRfZmx1c2hfaW52YWxpZGF0ZShzYWRkciwgc2Vx
bm8sIGR3LCBpKTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgaSA9IGVtaXRfZmx1c2hfaW52YWxpZGF0
ZShzYWRkciwgc2Vxbm8sIGpvYi0KPiA+ID4gPiBtaWdyYXRlX2ZsdXNoX2ZsYWdzLCBkdywgaSk7
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoGR3W2krK10gPSBwcmVwYXJzZXJfZGlzYWJsZShmYWxz
ZSk7Cj4gPiA+IMKgIAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBpID0gZW1pdF9iYl9zdGFydChq
b2ItPnB0cnNbMV0uYmF0Y2hfYWRkciwgQklUKDgpLCBkdywKPiA+ID4gaSk7Cj4gPiA+IMKgIAo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBpID0gZW1pdF9mbHVzaF9pbW1fZ2d0dCh4ZV9scmNfc2Vx
bm9fZ2d0dF9hZGRyKGxyYyksCj4gPiA+IHNlcW5vLAo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBNSV9JTlZBTElEQVRF
X1RMQiB8IGpvYi0KPiA+ID4gPiBtaWdyYXRlX2ZsdXNoX2ZsYWdzLAo+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBqb2It
Pm1pZ3JhdGVfZmx1c2hfZmxhZ3MsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGR3LCBpKTsKPiA+ID4gwqAgCj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoGkgPSBlbWl0X3VzZXJfaW50ZXJydXB0KGR3LCBpKTsKPiA+
IAo+IAoK

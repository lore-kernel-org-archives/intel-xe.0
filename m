Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF47E6F086
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 20:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9319010E0BC;
	Fri,  1 Nov 2024 20:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USokhEKi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6AD10E0BC
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 20:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730494062; x=1762030062;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W/RCDOIoZ5smuM98Awb4iyDCBMWLkGgRdnAkXbwCSYY=;
 b=USokhEKiDCW6xxVPiZMBuNybmQW2bqBnDkOPOMRf6ufi2iC7KN32RXwx
 8/aggIQmxxzCxc29rBVYrHgGMsMZsrdJB66z0oDyKN+O+cE3sqeZFOi2c
 TNv6Y93wouw209xo2mMv37JA1/JgV+kwFZYNm2NBzy0tOatgmgBrSCYmJ
 VF1XQvhQlfFJ2DFQs5AYfJnJcfAPydyhZ5NLG9e4FtLHwFF1T7JWh2bvE
 39+SEirau4W6/SLGvq0M4XJigqei6+6LpHTinR9S8b/b/v6gBOBcYP25j
 I/IghOU/zqGCqXNVYmWiEBvfbezelNex4+FGodtTX25b/NJOWkiBTGk+A Q==;
X-CSE-ConnectionGUID: IAsz9Jm9QcylhU451QsL2w==
X-CSE-MsgGUID: RGepPmRxR7KmAhpsOboaEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="34199337"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="34199337"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 13:47:41 -0700
X-CSE-ConnectionGUID: AKdRtmI5Q5KPAtJhgJdo4A==
X-CSE-MsgGUID: Y6vXZLIURqinwTwetnyY1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="83413857"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 13:47:41 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 13:47:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 13:47:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 13:47:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHQZgxR4D1V9lDaM5jGIr1bveoanhRFTubtafkqJo3hpEaXI/Y1mQczz+7hygWaoAU5204qccN2Br1uMaCMSLdOwjvmleVGLRjjroBvf7nWRoDtPh24P7TXyHjO/jT43zcXhDwjLuBhnMD3z46Ej1T1g13F8ihFm0b2BJ+E1r2SjV+EKAd4jgWGmk4fcuTSwPNUSqakfH15umGBzdFCctx96YiRVx1hO1hyseNSRWv2SzlNTPtPInzzZaXqIQpESglwO0mdkfj06QmkRss+4sIDJJN7FDFkj0pekSXECdo7Gk6OzZ9X4QtOXInyRlItHehksgSeQScricQaiUhid6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/RCDOIoZ5smuM98Awb4iyDCBMWLkGgRdnAkXbwCSYY=;
 b=NIkMA0tSPbFB+yKX29bZgKc1+xgsZkDP0kxdePqK6EU/zUoe0Ez3zRjvvWf95CSEOKJwTrDHhAtabSgKr/Jdz3gAxuNm9JosBb4H+wzzZWLRqOWp26+fxZFT8ttpimGPA6HZ3HEwo3TFbm5AYfofNj30GvbvnbQSN5gzPHMMk4sV7RGwjlhT7Ar0Q9o25B9aTfE93MdXWBTAwJVbYRouOVDia73D23DXKWSAvh5hApp+RKAhKsUkUiB+VeiFGHwdI+WwTKJPvCKsrjlXwK+fbCAjWINdrWimypy4P9N+iBtgBarVR7OXn+ChNZsOXiMFupiyP/KF/42xFYOVoi0Gww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by BY1PR11MB7983.namprd11.prod.outlook.com (2603:10b6:a03:52b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.26; Fri, 1 Nov
 2024 20:47:38 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8114.023; Fri, 1 Nov 2024
 20:47:38 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
Thread-Topic: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
Thread-Index: AQHbLIh6UcCqcibekk20ZmZZBCafgLKiw3iAgAAKRuCAAA5RgIAAAueg
Date: Fri, 1 Nov 2024 20:47:38 +0000
Message-ID: <CH0PR11MB5444240B935D3ABF926E2156E5562@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241101180403.97272-1-jonathan.cavitt@intel.com>
 <6a317425-bf13-4269-b510-04a765c3cc23@intel.com>
 <CH0PR11MB5444581AA95D474000743B9CE5562@CH0PR11MB5444.namprd11.prod.outlook.com>
 <80cb07e4-8049-4320-814f-7535b20e1145@intel.com>
In-Reply-To: <80cb07e4-8049-4320-814f-7535b20e1145@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|BY1PR11MB7983:EE_
x-ms-office365-filtering-correlation-id: 8c25fd41-4e90-446f-e406-08dcfab66c0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MVVGQkNhRW5TU1E3OGRZNi9lSGROM1ZkWjFUWHE1RUhQYzc0T3pNVGJ2dnUr?=
 =?utf-8?B?T0tVc2FpVzQ1YUQ1aGEySndMNkt4V21pbzlRSUdtSG9oUjBRSjJURkZlOXBO?=
 =?utf-8?B?UFBDbWJoUTM0bk8vQ0pIeGdzYXUzTVhOeExqV0RhUnZhcWdTVCtYQjJKbndp?=
 =?utf-8?B?ZlMwK1JKa0UrSGVKTHBCODExbGFKMzBpUUxNdDg4d2pSZGxjK0VqS2NPS1Zh?=
 =?utf-8?B?eGcxa1U2NmVRNlFXSWlHNWNkNCtHc1lZQWhlNGoxbUJ1WTFCU0g2V1N2T2Ro?=
 =?utf-8?B?OUF0QWdQbE5wNWNmQks1MHJWU0RNKzFqNkQyVmV5ckZYMjNCRlE3NUJ5ZTVV?=
 =?utf-8?B?S1FLZGltVzJvOW5LdzhvTmp5VjJ0TitNZFd5Z3BnZkd3WThCRDlneFEyVjFX?=
 =?utf-8?B?Ull3LzFHOVd5OHdhdk9CSytUaWNHb3dsSFNOYWU3b003bmZ1QzdJSkRaNCtl?=
 =?utf-8?B?SkZFRElYaTFpcTZ3SnVIS1p0MlZ3cWZrbTdieVdQS2c1d2RCU0c0RjV6Wk5p?=
 =?utf-8?B?QmRmZTk1Vm4xcHJBa3FHRkphd1c4cUZHWWtrbWVsVnJjOTF0NGI2NDB3SUJo?=
 =?utf-8?B?QjFnMVNTc25uak8wSUVQVG5meGxrYmRhOTZJNDQvaTJkbVFHVXMvUXhOdyt4?=
 =?utf-8?B?d0xoZlIwOFdYMGMwVmFnQ2JtRWJYMmdSRm1OUlI0WFp3WlA3K0EzUEtTakQ5?=
 =?utf-8?B?aXVjbU5JbWFWSzlUdGF4OFpoZG9FSVlBeXF2Uy9WNkZESERTc0IxeVZhUVND?=
 =?utf-8?B?OEJGSGVwWkhMbGRZZEdubnFNb1BONWhvYTRHR013dWpJdTI3MElFTjBpd3N6?=
 =?utf-8?B?MStKZlllOEpoL0VEd0orS3pJeGlHc0FjczNDdjh2aWpGdHJPNlpYcDFTQStG?=
 =?utf-8?B?NHFseVRST05vQXdtV1JZWFJXcmJHY2ltUUlPR3dVYkNvS2RmNytoU0crTHND?=
 =?utf-8?B?QlpDdTFBc0I4MDMrK1FYdmxxWHkwOHNvTjJ0d2pieTRsL2ZCSDBhZGUzT01q?=
 =?utf-8?B?QTN6NlR4eUNvdWNwT0wzOXFVdmFoblc5MmJzTXNTNHlvSXRXaW1zOTJHd1JV?=
 =?utf-8?B?NEZGZ2ZyZGNHeWJnL291aHQzenZvZzFJQnU4RE56c1R4NGFGUkkyR01DdzFp?=
 =?utf-8?B?RzZENFV5SkZYdVEwNXdac25jdVRNcUgvZmx2RUh2dkFiY3A3ZFA1SWYrc3lu?=
 =?utf-8?B?US9wNS9yL3ZVRmdBMGxtdmdIWU1UQmNFclBlY1AvRmdBWGIxQ2w4L09PZllo?=
 =?utf-8?B?cFArdHJBQnNhdldySE1kVytEMVROdU01MVFuNWVSMHE4YkRlUVNvZktMNG1n?=
 =?utf-8?B?c1Rici9QeE9nbTN6dXRtNVNQVzMrYXBGQkFFWk9oOWd5T001Qzh6Tm82RlVt?=
 =?utf-8?B?RnFGc09wOVNvdWR0UVdycGZNMlMyRDRiNWxOQldvSlQwTWFrNEhoZVhMTzcv?=
 =?utf-8?B?WTMzSHRTYzNXa3d5OEFncFB5cy9Xc3licjlVZVJvRWlVK1FSMytNVHRxZW82?=
 =?utf-8?B?NjZnRmVIZjQyNXVDUzc3VURHaHJxZGpZYkNNR2NSNzA2dWQ0WEVPalEvMkE2?=
 =?utf-8?B?UzArRWJDMWNTZDQ3SzFobXozR05kc3dyV0NqRlZ4UTNmSEEydTVYRlFiUFg4?=
 =?utf-8?B?cWRuamZHV3hBUE5MdmdUUnFYaktiQ2lKTWtXYm5NYnNpejcyL3JDdTVQanlx?=
 =?utf-8?B?d21rOFpCb08rb2N0Q3Z6OGxkcjE2cW1GQ3JYOHE5dXlLMkRhN1FkbVh0ckQy?=
 =?utf-8?Q?Iszw+W92i7Sd6G1AJMBjKbyInrSVRIPSy1Acxy8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnVXaXhHR3pWMHVmQmdadE9PMjhTbVJkOHJaYUZoTlVlL3hkcGZReGt0Um93?=
 =?utf-8?B?ZGN1V3R1YzdVNXZuZ0VaQmdMKzVBQngxcTJuNWJVdld3S0o3K1JObGtwNzVW?=
 =?utf-8?B?YnV6MjQ5KzRwbWozeXdFRzVKWGQxMHBVS2I1SGZNUkZCTFh4a252LzBFWHRJ?=
 =?utf-8?B?clFhYTY3Q1NoWmxsLzlBMis5YlJ4bUI1MXlQTlR1c21MeEp2eURsNEFmYWdm?=
 =?utf-8?B?NHNZYnlYVnFRMWY4THh2NkJvZ3FZdk9BUVBVTGc1WitIbVlpV0RGaXZobTRj?=
 =?utf-8?B?NEk3cEtiMnZGcDBCVUJwRGVybTRGMXpvTmtwcjJ5eDN4V2d1aWhKNUJFaVRt?=
 =?utf-8?B?L0NRR1VHOG9FWDNLR1VhdkNuT0pUQ3JycmZ5R2lPYVoxN3hkV0FoaWpTbjRx?=
 =?utf-8?B?cDdFOWlNVVZITnJMTVErNDdhZ3prVW45UTJkVnBsSUlOc3JOY2xZS3lSVzBy?=
 =?utf-8?B?NTcyNGV6MTJtRGRUL2xWZjBPUVBENGlvS2xUUXpheitsQWhjbjNEWkVYZ3BZ?=
 =?utf-8?B?b2ZIeTNCbENIbTlWc3czSDl2c1FlTkJrS04vMU1yQis5VldjSEhPdGl3WmVz?=
 =?utf-8?B?YzNFcjRGNFZZNEdvNVlpOVZhRHFROU84dEFZaTB4aEZ5bHZmR1RyV1FNN1B5?=
 =?utf-8?B?ditRcWd2NFY3ZEJ5ZnpGc0Z6VXdvWVB0RTJLdXYyNmF5Q01UTGRsZldqb04r?=
 =?utf-8?B?OFIzUGFrNXZ3am9TWnZBWUhpOHJWeXJPQWdGNHlPNm4yaTBUSkRuOFV1SXJm?=
 =?utf-8?B?cUZqVEJqbXhIaFovbU9qTmQ5Y0FNbnllM29YNnVuZVg1V2hXaFZzYjRVak5s?=
 =?utf-8?B?MjlLc3RsaVFFMXZMWDNDUXUzOWNtdS9sR1F2d0d0K1MzdzBxMVVKbVVQY3JH?=
 =?utf-8?B?WUx6UmJLWXlzMm9KUzA1b1pkMVUrYXVZTmtvNHhRbTltUkxPZ0VPbFVrTWZi?=
 =?utf-8?B?SkJ6b0tZcG9SNlNKL01zS0JnTkY3aTRSY0QrWjJaeHVNT3BLcGNFYXdoMXBj?=
 =?utf-8?B?NlJKMVVhYjNXUml4alluaHlUbm5aQ3lJUUF4MlRQQmxzWnIvazFrUWRBNFJl?=
 =?utf-8?B?QUtZSUhZZlFVNmRqaFQrRC9oT1Y1VTFQUzNIVUMxbkw0K2NDeTcxNXdkNFdZ?=
 =?utf-8?B?Y0RuNzNLZy9xNzJFTThIa2hLQmwvcllJU0VlV1hUcEpHV2Q0VzYyVFRwTm1N?=
 =?utf-8?B?cXo4Z0dkZVFtdmMxVUpUcFlYV0NhQWhUVXYzemo2Tmp5QlRWTzd2M3ZqdUpJ?=
 =?utf-8?B?ajhYSlAyeUc5TmRZQnBFeE4zUHR4TG1mN3g0Tm5vL1NTSzFTaXNjTEdONGNn?=
 =?utf-8?B?K3NLZy9SQkxIdWh1Vk53RmFQbERBeDc5MGR3TlNDSG9JM2xKYmc3YXlWaDNI?=
 =?utf-8?B?TWhJQ2pDQmc3T0tHblM5MnU4ckZuOEt5ZEZKK0c0ZkFscWJIWlpQemVZUnF4?=
 =?utf-8?B?MXJCTXVydkxYQXVzTm9LajFTZ056SVNrVC9tQ1JrdEQ3dHBEUVZaT25zUllR?=
 =?utf-8?B?UVpocmtCOThTclJmalVGNUdZWkJrQ0xUYTQxWWpjSWRvZ2grRnhIM2FscHlH?=
 =?utf-8?B?QjZwY3ZabjNIS2RGSFNleFkwd2d4aTdjTytvY1ZITHM3ZThVRDlNY0RuSExh?=
 =?utf-8?B?d2hMdHFVQnlhaDhYUTlQZC9LYVNkd0l2YjFUNHduL3BNd2ZzeEh6SlhHbUVW?=
 =?utf-8?B?dGZVeHRLRjVhbEJJcmZ1U2VuL0VVTHE3WEVSNVNYdWRTNEl3UW8ya3FwVzdD?=
 =?utf-8?B?TFQ0S3hzaVNXdGxRdTIrdkJ2QzUvSUZyVDdtdDB1ck12S2grOUIwMzJqMTIy?=
 =?utf-8?B?eHpoUExUa2crNldMVE1DWTJyVnVqbnlTTnh4NVhJUEo5bHFYdG9wWDg5RktO?=
 =?utf-8?B?Yng2bWlBR0MrMzhrVjBWWXpGU1RnZDBndXM2aGZZcDVqaGFveHlsTWlFSWNF?=
 =?utf-8?B?dEdMNmk2Qkduc0ZMbGpLb296cDFvU3hkcitZU0hVaTBjTy8rWGo1SXQwY0FI?=
 =?utf-8?B?K3picjV4Qzl1WFJUd052SWI4UlNlZmpGQldqR1J2OGs2MXd0WlJycUFlRTZi?=
 =?utf-8?B?alJpbjhpdkhqV2MwUWdyWVpYZHJ2RzZLOTVWR3FuUVBNRTd0eVhTSFQ3V1hY?=
 =?utf-8?Q?ExDKknJ5VWAYI8K7HwDgeodaW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c25fd41-4e90-446f-e406-08dcfab66c0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2024 20:47:38.3206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Iej5k5fQ7ukjI0zvlT8NkAu3LCbUZdVr1gsGo46p9T/+sllIKpuT2wybsNAbojJ0kKhYqqrC8HJQMUDcqtSIN7Y8NBAAOE/VfB+K+t+E58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7983
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEhhcnJpc29uLCBKb2huIEMgPGpvaG4u
Yy5oYXJyaXNvbkBpbnRlbC5jb20+IA0KU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxLCAyMDI0IDE6
MTQgUE0NClRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsg
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogR3VwdGEsIHNhdXJhYmhnIDxzYXVy
YWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47IE5l
cmxpZ2UgUmFtYXBwYSwgVW1lc2ggPHVtZXNoLm5lcmxpZ2UucmFtYXBwYUBpbnRlbC5jb20+OyBS
b3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPjsgRGUgTWFyY2hpLCBM
dWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgRGl4aXQsIEFzaHV0b3NoIDxhc2h1dG9z
aC5kaXhpdEBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGUveGVfZ3VjX2Fk
czogQWRkIHdoaXRlbGlzdCByZWdpc3RlcnMgdG8gd3JpdGUgbGlzdA0KPiANCj4gT24gMTEvMS8y
MDI0IDEyOjQwLCBDYXZpdHQsIEpvbmF0aGFuIHdyb3RlOg0KPiA+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+ID4gRnJvbTogSGFycmlzb24sIEpvaG4gQyA8am9obi5jLmhhcnJpc29uQGlu
dGVsLmNvbT4NCj4gPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDEsIDIwMjQgMTE6NDYgQU0NCj4g
PiBUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT47IGludGVs
LXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBHdXB0YSwgc2F1cmFiaGcgPHNhdXJh
YmhnLmd1cHRhQGludGVsLmNvbT47IFp1bywgQWxleCA8YWxleC56dW9AaW50ZWwuY29tPjsgTmVy
bGlnZSBSYW1hcHBhLCBVbWVzaCA8dW1lc2gubmVybGlnZS5yYW1hcHBhQGludGVsLmNvbT47IFJv
cGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+OyBEZSBNYXJjaGksIEx1
Y2FzIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+OyBEaXhpdCwgQXNodXRvc2ggPGFzaHV0b3No
LmRpeGl0QGludGVsLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGUveGVfZ3Vj
X2FkczogQWRkIHdoaXRlbGlzdCByZWdpc3RlcnMgdG8gd3JpdGUgbGlzdA0KPiA+PiBPbiAxMS8x
LzIwMjQgMTE6MDQsIEpvbmF0aGFuIENhdml0dCB3cm90ZToNCj4gPj4+IFdoZW4gcGVyZm9ybWlu
ZyBhIGd1Y19tbWlvX3JlZ3NldF93cml0ZSwgd2UgYWRkIGFsbCB0aGUgcmVnaXN0ZXJzIGluIHRo
ZQ0KPiA+Pj4gcmVnX3NyIGxpc3QgdG8gdGhlIHNhdmUvcmVzdG9yZSBsaXN0LCBidXQgZG8gbm90
IGRvIHRoZSBzYW1lIGZvciB0aGUNCj4gPj4+IHdoaXRlbGlzdCByZWdpc3RlcnMuICBBZGQgdGhl
bSBpbi4NCj4gPj4+DQo+ID4+PiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9kcm0veGUva2VybmVsL2lzc3Vlcy8yMjQ5DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhh
biBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+ID4+PiBDQzogTHVjYXMgZGUg
TWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4+PiBDQzogTWF0dCBSb3BlciA8
bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gPj4+IENDOiBKb2huIEhhcnJpc29uIDxqb2hu
LmMuaGFycmlzb25AaW50ZWwuY29tPg0KPiA+Pj4gQ0M6IFVtZXNoIE5lcmxpZ2UgUmFtYXBwYSA8
dW1lc2gubmVybGlnZS5yYW1hcHBhQGludGVsLmNvbT4NCj4gPj4+IENDOiBBc2h1dG9zaCBEaXhp
dCA8YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiAgICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jIHwgMTEgKysrKysrKysrKy0NCj4gPj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+Pg0KPiA+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX2Fkcy5jDQo+ID4+PiBpbmRleCA5NDMxNDZlNWI0NjAuLjJmYzZiMWNj
YzhmYyAxMDA2NDQNCj4gPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMN
Cj4gPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMNCj4gPj4+IEBAIC0y
MzksOSArMjM5LDEyIEBAIHN0YXRpYyBzaXplX3QgY2FsY3VsYXRlX3JlZ3NldF9zaXplKHN0cnVj
dCB4ZV9ndCAqZ3QpDQo+ID4+PiAgICAJZW51bSB4ZV9od19lbmdpbmVfaWQgaWQ7DQo+ID4+PiAg
ICAJdW5zaWduZWQgaW50IGNvdW50ID0gMDsNCj4gPj4+ICAgIA0KPiA+Pj4gLQlmb3JfZWFjaF9o
d19lbmdpbmUoaHdlLCBndCwgaWQpDQo+ID4+PiArCWZvcl9lYWNoX2h3X2VuZ2luZShod2UsIGd0
LCBpZCkgew0KPiA+Pj4gICAgCQl4YV9mb3JfZWFjaCgmaHdlLT5yZWdfc3IueGEsIHNyX2lkeCwg
c3JfZW50cnkpDQo+ID4+PiAgICAJCQljb3VudCsrOw0KPiA+Pj4gKwkJeGFfZm9yX2VhY2goJmh3
ZS0+cmVnX3doaXRlbGlzdC54YSwgc3JfaWR4LCBzcl9lbnRyeSkNCj4gPj4+ICsJCQljb3VudCsr
Ow0KPiA+Pj4gKwl9DQo+ID4+PiAgICANCj4gPj4+ICAgIAljb3VudCArPSBBRFNfUkVHU0VUX0VY
VFJBX01BWCAqIFhFX05VTV9IV19FTkdJTkVTOw0KPiA+Pj4gICAgDQo+ID4+PiBAQCAtNzI3LDYg
KzczMCwxMiBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGd1Y19tbWlvX3JlZ3NldF93cml0ZShzdHJ1
Y3QgeGVfZ3VjX2FkcyAqYWRzLA0KPiA+Pj4gICAgCXhhX2Zvcl9lYWNoKCZod2UtPnJlZ19zci54
YSwgaWR4LCBlbnRyeSkNCj4gPj4+ICAgIAkJZ3VjX21taW9fcmVnc2V0X3dyaXRlX29uZShhZHMs
IHJlZ3NldF9tYXAsIGVudHJ5LT5yZWcsIGNvdW50KyspOw0KPiA+Pj4gICAgDQo+ID4+PiArCWkg
PSAwOw0KPiA+Pj4gKwl4YV9mb3JfZWFjaCgmaHdlLT5yZWdfd2hpdGVsaXN0LnhhLCBpZHgsIGVu
dHJ5KQ0KPiA+Pj4gKwkJZ3VjX21taW9fcmVnc2V0X3dyaXRlX29uZShhZHMsIHJlZ3NldF9tYXAs
DQo+ID4+PiArCQkJCQkgIFJJTkdfRk9SQ0VfVE9fTk9OUFJJVihod2UtPm1taW9fYmFzZSwgaSsr
KSwNCj4gPj4+ICsJCQkJCSAgY291bnQrKyk7DQo+ID4+PiArDQo+ID4+IFRoZSBjb2RlIHRoYXQg
YWN0dWFsbHkgd3JpdGVzIHRvIHRoZSBOT05QUklWIHJlZ2lzdGVycw0KPiA+PiAoeGVfcmVnX3Ny
X2FwcGx5X3doaXRlbGlzdCgpIGluIHhlX3JlZ19zcmMuYykgZXhwbGljaXRseSBjbGVhcnMgYWxs
IHRoZQ0KPiA+PiB1bnVzZWQgcmVnaXN0ZXJzIHdpdGggYSBjb21tZW50IG9mICJjbGVhciB0aGUg
cmVzdCBpbiBjYXNlIG9mIGdhcmJhZ2UiLg0KPiA+IFRoZSBjb2RlIGluIHhlX3JlZ19zcl9hcHBs
eV93aGl0ZWxpc3QgY2FsbHMgeGVfbW1pb193cml0ZTMyIHRvIHdyaXRlIHRoZQ0KPiA+IHJlZ2lz
dGVycywgd2hlcmVhcyB0aGUgY29kZSBpbiBndWNfbW1pb19yZWdzZXRfd3JpdGUgdXNlcyB4ZV9t
YXBfbWVtY3B5X3RvDQo+ID4gaW50ZXJuYWxseS4gIFdoaWxlIHRoZSBmb3JtZXIgc2VlbXMgdG8g
YmUgd3JpdGluZyB0byB0aGUNCj4gPiB4ZV9tbWlvX2FkanVzdGVkX2FkZHIobW1pbywgcmVnLmFk
ZHIpICsgbW1pby0+cmVncywgdGhlIGxhdHRlciBhcHBlYXJzIHRvIGJlDQo+ID4gd3JpdGluZyB0
byBJT1NZU19NQVBfSU5JVF9PRkZTRVQoYWRzX3RvX21hcChhZHMpLCBndWNfYWRzX3JlZ3NldF9v
ZmZzZXQoYWRzKS4NCj4gPg0KPiA+IEknbSBub3QgcGFydGljdWxhcmx5IHdlbGwtdmVyc2VkIGlu
IHRoZXNlIGZ1bmN0aW9ucywgYnV0IGl0IGxvb2tzIHRvIG1lIHRoYXQgdGhlc2UNCj4gPiB0d28g
ZnVuY3Rpb25zIHdyaXRlIHRvIGRpZmZlcmVudCBsb2NhdGlvbnMgYW5kIHRodXMgd291bGQgbm90
IGltcGFjdCBlYWNoIG90aGVyLg0KPiA+IE9yLCBpbiBvdGhlciB3b3JkcywgSSBkb24ndCB0aGlu
ayB0aGUgZ2FyYmFnZSB3ZSdyZSBjbGVhcmluZyBpbiB4ZV9yZWdfc3JfYXBwbHlfd2hpdGVsaXN0
DQo+ID4gaXMgdGhlIHNhbWUgYXMgdGhlIGRhdGEgd2UncmUgd3JpdGluZyBpbiBndWNfbW1pb19y
ZWdzZXRfd3JpdGUuDQo+IE5vLg0KPiANCj4gVGhlIGFwcGx5IGZ1bmN0aW9uIGlzIHdyaXRpbmcg
dGhlIGxpc3Qgb2Ygd2hpdGVsaXN0ZWQgcmVnaXN0ZXJzIGludG8gdGhlIA0KPiB3aGl0ZWxpc3Qg
cmVnaXN0ZXJzIHRoZW1zZWx2ZXMuIFRoZSBHdUMgQURTIGNvZGUgaXMgYWRkaW5nIGxpc3RzIG9m
IA0KPiByZWdpc3RlcnMgdG8gdGhlIHNhdmUvcmVzdG9yZSBsaXN0IGZvciBhbiBlbmdpbmUgcmVz
ZXQuDQo+IA0KPiBTcGVjaWZpY2FsbHkgd2l0aCByZWdhcmRzIHRvIHRoZSBOT05QUklWIHJlZ2lz
dGVycywgdGhlc2UgYXJlIGEgc2V0IG9mIA0KPiByZWdpc3RlcnMgd2hpY2ggaG9sZCB0aGUgYWRk
cmVzc2VzIG9mIG90aGVyIHJlZ2lzdGVycy4gV2hlbiBzZXQsIHRoZXkgDQo+IGFsbG93IHVudHJ1
c3RlZCB1c2VycyB0byBhY2Nlc3MgdGhvc2UgJ290aGVyJyByZWdpc3RlcnMgd2hpY2ggb3RoZXJ3
aXNlIA0KPiB3b3VsZCBiZSBvZmYgbGltaXRzLiBUaGUgd2hpdGVsaXN0IGNvZGUgaXMgc2V0dGlu
ZyB1cCB0aGF0IGxpc3QuIEUuZy4gDQo+IGFkZGluZyB0aGUgT0EgcmVnaXN0ZXJzIHRvIHRoZSB3
aGl0ZWxpc3QgdG8gYWxsb3cgYXBwbGljYXRpb25zIHRvIHVzZSANCj4gdGhlIE9BIG1lY2hhbmlz
bXMuIFNvIGl0IGRvZXMgIk5PTlBSSVZfUkVHKHgpID0gT0FfUkVHIi4gSXQgYWxzbyBkb2VzIA0K
PiAiTk9OUFJJVih4KzEgLi4gbWF4KSA9IE5PX09QIi4gVGhhdCBpcyB0byBlbnN1cmUgYWxsIHRo
ZSBOT05QUklWIA0KPiByZWdpc3RlcnMgYXJlIHNldCB0byBzb21ldGhpbmcgdmFsaWQgYW5kIG5v
dCB1bmluaXRpYWxpc2VkLiBPdGhlcndpc2Ugd2UgDQo+IHBvdGVudGlhbGx5IGhhdmUgdW5pbnRl
bmRlZCByZWdpc3RlcnMgYmVpbmcgd2hpdGVsaXN0ZWQgYW5kIHVzZXJzIGFyZSANCj4gYWJsZSB0
byBhY2Nlc3MgdGhpbmdzIHRoZXkgc2hvdWxkbid0LiBXaGVyZWFzLCBzZXR0aW5nIHRoZW0gYWxs
IHRvIE5PX09QIA0KPiBtZWFucyB3ZSBhcmUgZ3JhbnRpbmcgYWxsIHVzZXJzIGFjY2VzcyB0byB0
aGUgTk9fT1AgcmVnaXN0ZXIgd2hpY2ggdGhleSANCj4gYWxyZWFkeSBoYWQgYWNjZXNzIHRvIGFu
eXdheS4NCj4gDQo+IENvbXBsZXRlbHkgc2VwYXJhdGUgdG8gdGhhdCwgdGhlIEd1QyBBRFMgY29k
ZSBpcyBjcmVhdGluZyBhIGxpc3Qgb2YgDQo+IHJlZ2lzdGVycyB3aGljaCBHdUMgd2lsbCBzYXZl
IGFuZCByZXN0b3JlIGFjcm9zcyBhbiBlbmdpbmUgcmVzZXQuIFRoZXNlIA0KPiBhcmUgYWxsIHRo
ZSByZWdpc3RlcnMgd2hpY2ggZ2V0IHRyYXNoZWQgYnkgdGhlIHJlc2V0IGJ1dCB3aGljaCBhcmUg
bm90IA0KPiBzYXZlZCBhbmQgcmVzdG9yZWQgYXMgcGFydCBvZiBhIHJ1bm5pbmcgY29udGV4dC4g
VGhlIE5PTlBSSVYgcmVnaXN0ZXJzIA0KPiBhcHBhcmVudGx5IGZhbGwgaW50byB0aGlzIGNhdGVn
b3J5LiBTbyB3ZSBuZWVkIHRvIHRlbGwgR3VDIHRvIHByZXNlcnZlIA0KPiB0aGVpciBjb250ZW50
IGFjcm9zcyBhIHJlc2V0LiBPdGhlcndpc2UsIGFmdGVyIHRoZSByZXNldCwgdGhlIHdoaXRlbGlz
dCANCj4gd2lsbCBiZSBsb3N0LiBCdXQsIHRoZSByZXNldCBzdGF0ZSBvZiB0aG9zZSByZWdpc3Rl
cnMgaXMgJ3VuZGVmaW5lZCcgYXMgDQo+IG9wcG9zZWQgdG8gJ05PLU9QJyBhcyBzdWdnZXN0ZWQg
YnkgdGhlIHdoaXRlbGlzdCBjb2RlLiBUaGF0IG1lYW5zIHRoYXQgDQo+IGFueSBOT05QUklWIHJl
Z2lzdGVyIHdoaWNoIGlzIG5vdCBwYXJ0IG9mIHRoZSByZXNldCBzYXZlL3Jlc3RvcmUgbGlzdCAN
Cj4gd2lsbCBiZSBubyBsb25nZXIgYmUgc2V0IHRvIE5PLU9QIGFmdGVyIGEgcmVzZXQuIEluc3Rl
YWQsIGl0IHdpbGwgYmUgDQo+IGdpdmluZyB1c2VycyBhY2Nlc3MgdG8gc29tZSByYW5kb20gcmVn
aXN0ZXIgYWdhaW4uIEFuZCB3ZSBkbyBub3Qgd2FudCB0byANCj4gZG8gdGhhdC4NCj4gDQoNCk9r
YXkuICBJdCBzb3VuZHMgdG8gbWUgdGhhdCB3ZSBhcmVuJ3QgcGVyZm9ybWluZyB4ZV9yZWdfc3Jf
YXBwbHlfd2hpdGVsaXN0DQpkdXJpbmcgYW4gZW5naW5lIHJlc2V0LCBiZWNhdXNlIHRoYXQgZnVu
Y3Rpb24gc2hvdWxkIGJlIHNldHRpbmcgdGhlIHJlZ2lzdGVycw0KdG8gYSBkZWZpbmVkIHJlc2V0
IHN0YXRlLCByYXRoZXIgdGhhbiAidW5kZWZpbmVkIi4gIFNob3VsZCB3ZSBiZSBjYWxsaW5nIHRo
YXQNCmZ1bmN0aW9uIGR1cmluZyBndWNfbW1pb19yZWdzZXRfd3JpdGU/DQoNCkkgdGVzdGVkIGl0
IGFuZCBpdCBkaWRuJ3Qgd29yayBvbiBteSBlbmQsIGJ1dCBJIG1pZ2h0IGJlIG1pc3Npbmcgc29t
ZXRoaW5nLg0KLUpvbmF0aGFuIENhdml0dA0KDQo+IEpvaG4uDQo+IA0KPiANCj4gPg0KPiA+IC1K
b25hdGhhbiBDYXZpdHQNCj4gPg0KPiA+PiBJZiB3ZSBkb24ndCB0cnVzdCB0aGUgcmVzZXQgc3Rh
dGUgdG8gYmUgdmFsaWQgdGhlbiB3ZSBuZWVkIHRvIGVuc3VyZSBhbGwNCj4gPj4gb2YgdGhlbSBh
cmUgc2F2ZWQvcmVzdG9yZWQgYWNyb3NzIGEgcmVzZXQuIE90aGVyd2lzZSwgdGhhdCBnYXJiYWdl
IGNhbg0KPiA+PiBjb21lIGJhY2sgYW5kIGNhdXNlIHByb2JsZW1zLg0KPiA+Pg0KPiA+PiBKb2hu
Lg0KPiA+Pg0KPiA+Pg0KPiA+Pj4gICAgCWZvciAoZSA9IGV4dHJhX3JlZ3M7IGUgPCBleHRyYV9y
ZWdzICsgQVJSQVlfU0laRShleHRyYV9yZWdzKTsgZSsrKSB7DQo+ID4+PiAgICAJCWlmIChlLT5z
a2lwKQ0KPiA+Pj4gICAgCQkJY29udGludWU7DQo+ID4+DQo+IA0KPiANCg==

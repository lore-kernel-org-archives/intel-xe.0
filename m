Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12244C54E90
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 18:03:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857DD10E813;
	Thu, 22 May 2025 18:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/cEdRhy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2006F10E813
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 18:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747936993; x=1779472993;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=hxt44+derCDPQJ6aOHbrqQct+QWtwRhsi+ApJ6PrZj0=;
 b=P/cEdRhyj9Cu8Kl8lJUVgU3+fY3m8kuJVTbrPFnlZRYCvlJuIK5+HWeu
 rzy+tMwBMRdFOVAhXbJfKDPuKpZz+Jy2cwt0HkDyVD0ZXENk8dZZPl8Mf
 J2KYv9X30YNwZBv1GziJdrtljpRlJL8aTajVvscVTcyUM0cx380wELZZ2
 CQtKCOLNQjSl4iCR/c0dBNKFm6itapy8I+1BpE4I/lcl5g1O/Im9z4exk
 ldOx+ylGNNRsSycFM7n/qKw0lpw1YYdQOcDiy8rkZT9AO49svDqZC9OQT
 GQGEyFxmNFyM6eK/43ilFE1hLMpU2TltHvL34W6aHNmM3vAEMYLSrFiVZ w==;
X-CSE-ConnectionGUID: 0aqbqPs/T4WPZIR+FrYwRw==
X-CSE-MsgGUID: kqWua8xkSmygXCBhqWcCJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50124994"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="50124994"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 11:03:03 -0700
X-CSE-ConnectionGUID: iFfAgX1BTJ+qoklnm5LlVw==
X-CSE-MsgGUID: Hk6ZdIGRR42z8YyyTzrVWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="177855690"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 11:02:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 11:02:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 11:02:56 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.65)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 11:02:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRkHM0uD1LfdwhgNsqFuiGjs6n0CMdi3eQG2P3PFRscq1CwXCm+JQVhhM6qslyAT5XG153P5bLVt7cAIBnqu9zo0lsaAzeTPzeHbQ0PSZ0YB+Wx7RpFpcwp8UpeKUvVefRng4q2c1AJMSSgA3OOFn3mufXsIr8U1iB9Qv6fw/Ie8a/jgh8p3Vsll1vnISzCsGmt0+QSr9ORuX5tFwHwaGfvBz6YsHzPj+I8Y8D4Na5vzJAU8y8S26Q9Osqizw1eJ8Gf/P2unYlhZGlbg32tX1ieR22LDXaO/cf7IiqAiw1/psyjt9Cfu/Ypz/vtyEWDQyimHTBYXQMqkWxYQHeRsEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxt44+derCDPQJ6aOHbrqQct+QWtwRhsi+ApJ6PrZj0=;
 b=rro1YL4QTEEQrNXJ8szHTT5ijrqz729Gja7FePwTy+AJhYTGJb69AGqK0M5xsnEJop0Z+M7KELpoX4grV+Jn3YbVhaVHSl6r2+fQQKoHxXLYUzgTTw2jlqXiqdTGLhgEwh8kLaZ2u8+LmFXOHBC5NSukFsvCc5x6VKG1H/WjaBseAm0mHAqC2drkE0AndPGZIgld07y9F0w2VFVSvIASsYXJLYNWuCZunbbwEkHrDTmGpYXedc71MH1k8rVM5KI6Beei9A4gygPRjSbEXsmWs+hNYFjGtFq9zx+W1Sh+1cJSyVt4droAMV+FxpYCXcMVZQQuEHaq0Y6O2Kq1D+yTDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.21; Thu, 22 May 2025 18:02:47 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%4]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 18:02:47 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Have LRC hold VM reference
Thread-Topic: [PATCH] drm/xe: Have LRC hold VM reference
Thread-Index: AQHbyrh1HJvgYLs83UCjmUZCho3MPLPe8gAA
Date: Thu, 22 May 2025 18:02:47 +0000
Message-ID: <e92ca274b72000720f976ce10b5c3de77ac1439f.camel@intel.com>
References: <20250522012252.2175683-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20250522012252.2175683-2-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS0PR11MB7441:EE_
x-ms-office365-filtering-correlation-id: 2de7e090-a05a-45dc-bd62-08dd995adc3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eXZabUQzaFJHRnQ5WTJZTUkxeFp0dWJ6UTZJVWUyRGhsVVdUT1VkTWl2aytY?=
 =?utf-8?B?NGduN2wrNWRlY3NXb0xaeVJCN2NDWnE4T3podCszNm5XN2trYmhHQWMxSnNW?=
 =?utf-8?B?Uk9YeXpVTU5LOXdmU3VCMGFKQ2M3RDZ6UGNZSFczNnVubzcxbWFubzQxQnQv?=
 =?utf-8?B?eXNLWGV4cGtPQ2ZtMXRqVnhJSUtXWW1tME1QeE1MTEw5MDFVNnNZcmZ1QU5U?=
 =?utf-8?B?QmszZ2pqbTU0ZkM0d0dqNXpPSHZRd2FTREh4YVBUNTJYcjJJMWJNVExwVnE5?=
 =?utf-8?B?R0FkZGx1aUpFNUo1eHh5MU52Ky9IM3JFeXBMNElTSkRXWjMyR3ZXSXlHZW1K?=
 =?utf-8?B?bzFLQ1crUkhQOE5JaDI3cTZscE1rMWVUYmQ2TzB2eEFqdklzQklBalFkUVN5?=
 =?utf-8?B?M1VDMTRHV2R3eXFwYkZWaEFxaFJwK3p6WHpOcXFYWGo2UmU2UWVISVh5L3BS?=
 =?utf-8?B?S3Mya1E3elE3bFRqSW9nZFAxN2NCUCtLaGY4NGlScjNxZW95SDd2c09Ybm1T?=
 =?utf-8?B?aXpBK0x0ekFwQUt3K2hMcVNHanh1KzRqL1ozQmg4Y2NqL0dDbVlYYy9QQUFR?=
 =?utf-8?B?SThMYzNpRk9jVWFXa3hmUW42a1FTd3dndjY5RG1HcFFYYVk3cy92elRqa3I4?=
 =?utf-8?B?bFBjMUd3dUdZdFJyTW1HZElUbndJWkdNRlBqRGRyaGRWOGZlbVBNVS9SM0JN?=
 =?utf-8?B?ZCtkdDNwUktCQ1FVNm9aK20rckFXSDFMR2p5bExOUDlIMUxoVzk2WmJvOCtV?=
 =?utf-8?B?WG8yK1lMZUZ3VWNZWVlxdm1jUWg4NExwbGo0NHBFbUtqb0NiMytBekJDVmNG?=
 =?utf-8?B?SFlVVWl4ZlhvejhmanZUU09SOHQyekIxRFc3cjVNbzI4N1lybEZOUk5VcjNB?=
 =?utf-8?B?Y0xxbHdaWkVWL3F6VkhKK3RZd0JJYmZhSnZHQ3J0bXFIZkk4bW1oOG5vL1gz?=
 =?utf-8?B?OE10ei9jL2JUQm84QlBWczd1OEF4M2NrWXYrSHorVzhrZUsvOUJ0VUc2bTFO?=
 =?utf-8?B?bCs2QkNsNnlBMWVMN2k2VFpkUisvaXF2akNnUEhrbGZDb1IwNGlyc0tCajhH?=
 =?utf-8?B?NkU0TnhSSnRlR0JjOVp5OStuNjd3dE53cUZVcDRBZHFWNklIYXdQVHZiL3FS?=
 =?utf-8?B?YmE5UWszajFhNlMrMXFjQXJhVnpHeEZCdlJNMnM1QWxDR2lqMHR5Z2JVdm8y?=
 =?utf-8?B?Z01GQTZFdWhUZGlaUnpncTZYTVIvSnFTL1lwalVIWUJHV1BhV01OQjYxdmN1?=
 =?utf-8?B?bnZHT3Z2THM1cUFHQS9YT21HTzJEaXpMenN0U05icjVXdHRlNWhrMm1BSjhC?=
 =?utf-8?B?cDNpWFlMVXdQdEhkN2QwM1FOTkg1alh4c3RpTzhIQXVoRmlYcUROMEZsSlBx?=
 =?utf-8?B?SDNVdVJ3MHpZWm9mZWxlN2crUnArSWlUazhiaVJxRTF0SWpkRmVnL2t3c3BP?=
 =?utf-8?B?VkZZQWxaRkxQQTR0em12MTdhTDJhVFBLd3B0ZHdDbGh6MEJkdER3WTdqUGF1?=
 =?utf-8?B?K3kwRkxrekZ5L3VqNlRJOGNjeEF0WFpHaUI3eWpiUEFNRFZOUExLbXI2M1RZ?=
 =?utf-8?B?M2NaM3VOVm05ZmtzT0RucUo5UXI5MDJXMEVFNFVseUlwczA5R1NpMjN1NjFw?=
 =?utf-8?B?YmdvYmE5MGFtS0xiK0ZscStuT24vZjRZVHhWRTVUR3BDS2dVRi9Lc3dRWmhu?=
 =?utf-8?B?RDV2T0pMdHUvMzBNTzMrUUhnUUNnL0s3NDd1SHh3akZVMGNuQUFHRGxqUTBv?=
 =?utf-8?B?cGJxUVVFVWRySGV3aCtobHovY2ZSUVBoV1NqRTFNNjlybTZzZGorSEw2MStr?=
 =?utf-8?B?ckVvazJYeFExckkzMU9GdDY3Wk5XYmRnbXEwOVpnQ1BldC9NdFRscitPdmxH?=
 =?utf-8?B?aUJVS0tBSkwzeDY1cVYrdEE0ekpIbDRHSnFRSFZrcXpGQ1J3SXlQVUVXQ0lw?=
 =?utf-8?B?aklQWkp0dG9EWTFSVDN6VkFveHNwWCtObWMzU25sbU1NOXArdWpOV1k5TFdX?=
 =?utf-8?Q?7iG+a/eBsGbcVUO2lb4AJDQfwF1MO4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVAxSkVrWjAwQ1cyQnZ2dlFPbzlIdmRBUzRUb2VFbEgrOXJUdUttb0dLZFQ5?=
 =?utf-8?B?REt4eTR5djRzb0J2aldWdFdGMXQ0R01sK0VzaWZteTU2N25MVGFPVFJEZTJv?=
 =?utf-8?B?UHhIRkZEVEVxaXdVNGhFR3FmeWNSeVh0RHlrY1I0T0pDZUxRVHJ4S0tsV09P?=
 =?utf-8?B?NzJCOUNzYTFWWjNvL25TdWVBVC94bjBwTGJJbGRKQTF1VGZBN2RLMFFUTjlM?=
 =?utf-8?B?SkNKdVJ3ODRBWEFXdVlBblJFeGt5ODhkcFJMcEY1OWZQM3BQVXJnbmp4ODE1?=
 =?utf-8?B?NVFLbFRENFBKNkZwdEdWSytrenVkTnZuS1dHVmJtRmNuZE5iWkZkckRIRWpP?=
 =?utf-8?B?NHlHa3ZVcnV3bURmWWZ2NXd1QTVFeW1XK3ZEM3FsaU1KbTV1OUd5VEgvdWxB?=
 =?utf-8?B?K2dWVHQ4d09PNktpbTZKNWd0allnRDFtKzNGcWE2TFowV3VWUi81Wkswb05p?=
 =?utf-8?B?R2ZPRmhhL3pESDBKaVNVRlVDWitzVDYzdHoxRGJBVHVoK0JrRHVrYW9XRmRu?=
 =?utf-8?B?QUtFWXBWSkhML2tITnNNc3dRcHNnY3I2WFk2K3c1ZVY3Tzg3cERvWTlEWDFw?=
 =?utf-8?B?MmpFS3pDK0VROFFhZStydDQrOHcxdzBQTk5vTS8zUGJKS2M3QjF3Y2IzbHpM?=
 =?utf-8?B?RVJ0YjVsekUyWStMK3dZbjJvWXl4aUt0WmlVMFVBMG52bHpuZ2p3Nmd4amlJ?=
 =?utf-8?B?enVrZDZKYy9LeWdHVG95QitVUnBQTTA1K05GdXVsQ1BFWnFFTEtCOC9vOTVr?=
 =?utf-8?B?Y25tU0FFSUVLTDFWODFlSXRVNXBER2Fja25yZkppZmk4ZzFSV1BWWEtISGgx?=
 =?utf-8?B?aGJqWk5IS2NnMlBZeGhYTDRpb1MxNkRPdmtWc282Qit1QXdNT3FpUkc0aGR5?=
 =?utf-8?B?VDhEV21kQ3BLcEpVbEZ1VGhSZkpLNU81TkxyRDJFaFdCYUFKMm8xbU1BTVJm?=
 =?utf-8?B?WmE1ektLRW5TT1RqZmZyUWtZYnVtSjdja0Eyd2xiNElQbG5QemVORW5wZXIv?=
 =?utf-8?B?SlA3YTJPdys3L3FrWEFzMWV4ckxURlhhSFpnaWtLMU85b1IvQTUxRTdZWVVi?=
 =?utf-8?B?RFJoT2hVeUxNSjNsQkxYelBERUZJb0YzOU9xK2lacitPcHBwV1ZDWnlKaFpO?=
 =?utf-8?B?T3dxR2RqYjJLNTFtanhlejVpbnVDb05TVmFBZysrcEQ4enU4MVFEY0o3eTR3?=
 =?utf-8?B?bUcveWVTT3kwcVBESk96UXM0SWdkN0lid3d6WHZsYkJhZW9QK0lSUTNIRnMw?=
 =?utf-8?B?QThxbzRsa0k5azZkTjZzNkd4NGNFdHFTc2oyVlQ0Mk5aMW9tQ05jbWN3YlVV?=
 =?utf-8?B?Mkc1bzY4OGkxcTFsVmlFd2UwWG15NUtwdlJ0Ynl0aE5qbTNWUGZHZXRteUtz?=
 =?utf-8?B?ZFhyWnQ4Si9MM01LdFFMekN5R05YL2FUOUkweE1LcXRjT1AycDVLZnpYSWh6?=
 =?utf-8?B?eE03UFNDbDBGOVRQZTAwQ3EwU1pWTDVVa0pySERjOE4vMDhvSWJFYzNYeUhY?=
 =?utf-8?B?TnNnb3lmMkJYVllGTlVVa091WG0vRWl2anQvS0VhVUIvVEtXTTlrdnBYS3Fl?=
 =?utf-8?B?eit0Y3dxd3lkRXlyZS9EY1BmSUI3VjdvUEc0N1YwYzBCRHBZWFo1UjY2cTA1?=
 =?utf-8?B?SkdlN0ozRFJSemE3WWppRFdBMHMrSTJWbmxxTVloWU5tRkx0RHAzdGh1UENZ?=
 =?utf-8?B?dzJqb0JYUVUwUHJMSEZoY25iZTRCcFI0ckdUY08vTDZ2cTNpQ1VUQ1VpUjd4?=
 =?utf-8?B?RUpuNUVUVUxjNCtldXpqb3E2RStYWHZWa2xpMFh6dG5kZDljakZlVXlhdmYz?=
 =?utf-8?B?M3JOQVd2MHp1OFR6ZlR1UnpXakNuSXprRGxYR3Y3NVVJK3B6M2cyQU56d2pq?=
 =?utf-8?B?N1FrbXJNdVJ2MyszNlNBUlFuUHpxaU5USnpaQ1hOOXhSTHBhek0vZUJiY0Jz?=
 =?utf-8?B?Q2FuVjlPeWJkY2F3SGw1REcwY1lXSm42cDM2SGkrR3V4K1l6WVhaZWQ4czRu?=
 =?utf-8?B?bjFvakoraTJjTklwMFNhWTVVNU1MQ3EzeEcrUUtHYnNnb2ltdnVISk1ubzY2?=
 =?utf-8?B?MWZ4T3B1eDVFazV5bWd6SG9FeVpwU0FFZDNNTzZZR1VlR0N2dko0eFdoY3Vr?=
 =?utf-8?B?cWszM0pGaXhDU0tLY1BEanNlWno0aDNGdzdrZUVSalRVRUdreG4vOWUzaWxI?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0767345EF0B03542A7AF100E6B3A5FBF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de7e090-a05a-45dc-bd62-08dd995adc3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 18:02:47.7470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SDk5lDMzH1Bow+7CwF1tpuywM/BPj0NX1bLqMMjPQQO3g3OguKPmL/B3dRmjiGiSaq7yned/+KD339naGFU+g6JjKQi9snj1VWPp3ziYiUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
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

T24gV2VkLCAyMDI1LTA1LTIxIGF0IDE4OjIyIC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IExSQydzIEJPIHVzZXMgVk0ncyBkbWFfcmVzdiBvYmplY3QuIEhhdmUgTFJD
IGhvbGQKPiBWTSByZWZlcmVuY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmlyYW5qYW5hIFZpc2h3
YW5hdGhhcHVyYQo+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4KClRoaXMg
Y292ZXJzIHRoZSBjYXNlIHdoZXJlIHRoZSBWTSBpcyBjbG9zZWQgb3V0IGZyb20gdW5kZXIgdGhl
IExSQyBhbmQKdGhlIExSQyBCTyB0cmllcyB0byBhY2Nlc3MgdGhlIG5vdyB1bnJlZmVyZW5jZWQg
b2JqZWN0LCBzbzoKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0Bp
bnRlbC5jb20+CgpCdXQgbG9uZ2VyIHRlcm0gaXQgd291bGQgYmUgbmljZSB0byBkZWNvdXBsZSB0
aGlzIGluIGEgd2F5IHRoYXQgYWxsb3dzCnRoZXNlIHR3byB0byBiZSByZWZlcmVuY2VkL2RlcmVm
ZXJlbmNlZCBpbmRlcGVuZGVudGx5LgoKVGhhbmtzLApTdHVhcnQKCj4gLS0tCj4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfbHJjLmMgfCA5ICsrKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJj
LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYwo+IGluZGV4IDYxYTJlODc5OTBhOS4u
ZWZkZjRlZjM1YjM1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYwo+IEBAIC05MDgsMTIgKzkwOCwxNyBA
QCBzdGF0aWMgdm9pZCB4ZV9scmNfc2V0X3BwZ3R0KHN0cnVjdCB4ZV9scmMKPiAqbHJjLCBzdHJ1
Y3QgeGVfdm0gKnZtKQo+IMKgCj4gwqBzdGF0aWMgdm9pZCB4ZV9scmNfZmluaXNoKHN0cnVjdCB4
ZV9scmMgKmxyYykKPiDCoHsKPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfdm0gKnZtID0gbHJj
LT5iby0+dm07Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9od19mZW5jZV9jdHhfZmluaXNoKCZs
cmMtPmZlbmNlX2N0eCk7Cj4gwqDCoMKgwqDCoMKgwqDCoHhlX2JvX2xvY2sobHJjLT5ibywgZmFs
c2UpOwo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9ib191bnBpbihscmMtPmJvKTsKPiDCoMKgwqDCoMKg
wqDCoMKgeGVfYm9fdW5sb2NrKGxyYy0+Ym8pOwo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9ib19wdXQo
bHJjLT5ibyk7Cj4gwqDCoMKgwqDCoMKgwqDCoHhlX2JvX3VucGluX21hcF9ub192bShscmMtPmJi
X3Blcl9jdHhfYm8pOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBpZiAodm0pCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHhlX3ZtX3B1dCh2bSk7Cj4gwqB9Cj4gwqAKPiDCoC8qCj4gQEAg
LTEwMTMsNiArMTAxOCwxMCBAQCBzdGF0aWMgaW50IHhlX2xyY19pbml0KHN0cnVjdCB4ZV9scmMg
KmxyYywKPiBzdHJ1Y3QgeGVfaHdfZW5naW5lICpod2UsCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChJ
U19FUlIobHJjLT5ibykpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
UFRSX0VSUihscmMtPmJvKTsKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoC8qIFRoZSBscmMtPmJvIHVz
ZXMgVk0ncyBkbWFfcmVzdiBvYmplY3QsIHRha2UgVk0gcmVmZXJlbmNlCj4gKi8KPiArwqDCoMKg
wqDCoMKgwqBpZiAodm0pCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3ZtX2dl
dCh2bSk7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqBscmMtPmJiX3Blcl9jdHhfYm8gPSB4ZV9ib19j
cmVhdGVfcGluX21hcCh4ZSwgdGlsZSwgTlVMTCwKPiBTWl80SywKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0dG1fYm9fdHlwZV9rZXJuZWwsCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9fZmxhZ3MpOwoK

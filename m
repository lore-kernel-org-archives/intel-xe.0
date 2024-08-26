Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A680DC5321D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 12:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726B310E1FA;
	Mon, 26 Aug 2024 12:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SyM8ntNA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6269910E1FA
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 12:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724676003; x=1756212003;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=T7copamTMUvE/Uf5GMenQ0IxABRKYpUaTyertgeiKig=;
 b=SyM8ntNAhuNW9zqH91286nvCS72DoOOx54h0F+uGUBHWVs4BF2t4LJYE
 xbCXJUOs5Xk4bpXADG09pfqPenhPvV4/likqANueoAyZhxg0E0nJleyBG
 V4oBJWuejFwhYKEdeW3kUHmIj95b922Rx0nABW5CGbLv2nP5Zay0nj0Bo
 0IN/At5QebTRT0sPpvUPWOTPKxxbhKAGzlnkP70hkILIN1ACCJ5IMTaT9
 bpyABdyoij+J4si024ijJW3yXq79l0Ya1xmaQNHFkmH7QHwS1hURD5BWn
 Dd7gjBNhR8gWw024Vg7sts+mnxdrJfibkk0pgcPVUx5Tpghu4TKdctQHR w==;
X-CSE-ConnectionGUID: zS9M1jbASFKnIQCQGjyTWA==
X-CSE-MsgGUID: 2bCAVyPwTtmADU0E6iUIxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="25988313"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="25988313"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 05:40:03 -0700
X-CSE-ConnectionGUID: i+G5Mx08R2KudNvX9IDiMQ==
X-CSE-MsgGUID: CWfAP2ktRtSVzLzmug8tRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="63031500"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 05:40:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 05:40:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 05:40:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 05:40:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 05:40:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVp7AbdVXi6dv+jO450OZmZiW0rwh8WnCnsP+tSbT99jmAXs1rt5ZI2+X3kCkOOev1jzUD1MQ6DmtMZ73J0bEDwUCEI8hJ04GHTLl4YYPUF89aDR8fvLyndVP089juh/h4LzY1V80PemWZ/NU4k7rft7rlqRoO6lreER/NMMZEWnqH97mwyz8c2GGo8V2XmMT1VQEnwoVgiX9tKMbrGHRX1t9ejXJJ3YmcOLQ7FP0RCiEpvj+l9q0SEuAv3fzRDj5jRhhryf6XMxw1vKz4idaO0sROfM+fkDBJkznwl/JCi7VDQTy+FiQijpREZiDltIBZAENlQEk5lfYh5CZpWaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7copamTMUvE/Uf5GMenQ0IxABRKYpUaTyertgeiKig=;
 b=vnN4ritYnlwoFwo3sKKHwKtIeo1q8xaUF19djPYE0jLoiteN+qWeLXj0wpwEZQCmpDcm3AoG6apMxQpbBIztbrdrGszYe87HD9JNLOpqQzM8/YW38SvzJmmIZMj8QW8PasJ+WxWX18Pcci5Bh48GVwLlKRjBBpdFcZxemNK+8XRbpUGOtSRlzvoWKy4eFOygINURyFKAG3Dfduvfcr0/2O6c1kkY8UGjd33ENGWxyEhKcZXUEb4bTefrG+c7uZdeGZiRymm7gp3t4IVDkIa3xP85DdqK93IQ939Y7E9ioVXa+Q2nv2eDJdyd8JqGWIalBRNa6QAJuuwdRo+VWAiBzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7730.namprd11.prod.outlook.com (2603:10b6:930:74::13)
 by MN2PR11MB4536.namprd11.prod.outlook.com (2603:10b6:208:26a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 12:39:58 +0000
Received: from CY8PR11MB7730.namprd11.prod.outlook.com
 ([fe80::9d99:8882:fb1e:3ad1]) by CY8PR11MB7730.namprd11.prod.outlook.com
 ([fe80::9d99:8882:fb1e:3ad1%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 12:39:57 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: SRIOV RPM resume lockdep issues
Thread-Topic: SRIOV RPM resume lockdep issues
Thread-Index: AQHa97UPI6DayFlf10efaDzNgUK/ZA==
Date: Mon, 26 Aug 2024 12:39:57 +0000
Message-ID: <3e13401972fd49240f486fd7d47580e576794c78.camel@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.4 (3.50.4-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7730:EE_|MN2PR11MB4536:EE_
x-ms-office365-filtering-correlation-id: b04bec53-33ab-4282-bf46-08dcc5cc31c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VmFKd1F3eWRTWlBYRWEyeTN5dVUvZ1h3V3daZVdTRHorSmxKd1Z1S015QXhm?=
 =?utf-8?B?L1VGcUJ0UDdpaXB0U3EycUJCZzQ1V1VpY2w2T3BsVUF2N0s3alhDOUV1OHM1?=
 =?utf-8?B?Um1lR1hLbFFqZ2w5c1BmODlmcldYNEl3SHVvNndXUURyZkp1eVQ4SGVpYTRi?=
 =?utf-8?B?LzNrQUtJRlJ5RHM4NlRZQmMvS3UzWUFXcmI1enJaQ2d2aXBpWjkyZ1hYaU94?=
 =?utf-8?B?TVdCRnVTUTlWU3ZEZ0RNNzlIbXNVZk5PRFZsclRaTlErOFRTQVNCRTIzWktT?=
 =?utf-8?B?NldHcUlMM2lxN2VDN1Y3djZKdHQ4RE1jOVU4VHlSVklkajZUZnhDWmF2TENV?=
 =?utf-8?B?YjNkZHNiOHB2ajdWL2h5Mi9PcEN1ejJ3em9NRmo1aHZ5ZGZodm8rRTExQnc3?=
 =?utf-8?B?RVh0Z3pnSVZGQ2hIYTF0STVxQStTcEJBVzIzaFZ3Kys0b3UxN29qeFJiZFBy?=
 =?utf-8?B?YWRBWEs3RHUzS2M0M2tsRGZDMmF3T0tHQ1pPQ1o5K0h5N1V1dWZwM1RsVXQz?=
 =?utf-8?B?R0NqTzArempOeHNrUDdwekJMR2FGNHYyQU4zWXRMSUdUWGlPdTJ1OGp2dWFy?=
 =?utf-8?B?T0pydE9IZEJzamlMRENkb2paT043YUNQb0pNMmNBU2ZRM0tQQW9pRnlCOWdN?=
 =?utf-8?B?RnpoVXd1c090UDlRRVJza3A4OHVJSUR4c0x5VThNZFRVaGdDZ0l6cENaK2Zk?=
 =?utf-8?B?MXhQLzFrYlJxRDF4c2VHcXFQQXUyMy9jbzhsV0MwRVlqZ0RSVSs5UkNwZXFB?=
 =?utf-8?B?WGhxazh4VkhzY2pERFkxclZhbm9tWnMxK1pZMHNRSzh6L1dNQmFmcit6bm5F?=
 =?utf-8?B?ejVQV0d1bnlDeGZOaWlTcUhTQ2E0dWhVSnpKK0JtcHBsNnlBa1NzQlM3aTZw?=
 =?utf-8?B?dE9melNUWkZab3dDQUZob1QzcnFtVmdVdThJdHM5bkpybjJlZEgyY1FrcTJw?=
 =?utf-8?B?QzQ4RDQ1QlVKS1NhMkxxU2IwSGJaNDFZSnJlNEprZGtqbVlPTkJOT2dHRUNi?=
 =?utf-8?B?My9NQ2lrNXpsKzc1b0JlcytSK0dRaTcvYWlvWms1TTh0dDdQYVZSVkxpM2xZ?=
 =?utf-8?B?OUFFU3lIU1JSNXd3cHVIVGpsQjRlRTBEVXdvWTU2ZEd2dnRmQTJzRjNFeHNM?=
 =?utf-8?B?UVdHOXpJV3p1MS9GYlZvM21kRlFhSkxTUk1wdlFKNGhtOE10YTl1ZGxRZVAz?=
 =?utf-8?B?Q2Y5KzNaZzhjS0kxSVJhTENkSnNjRkt2OXF2dGY5WUVvUUZPM05EQmFjNmEz?=
 =?utf-8?B?VVR1NzcwN3JVSVl2T0tmS3ZvZG9SOFQ4aW84bDlOb0Yra2ZTYTkwMHkydmdy?=
 =?utf-8?B?ODl6b2tDcHJrWWZncm1zbzNZY2NoRngxRVRqUEhFdGlFaXhseFMyTVMvcENa?=
 =?utf-8?B?bXhkN1hNUkQwVXFtZ1R5YWtsUkR2RUttemFibTgxL3A4aXRZNDNTckNPcDl4?=
 =?utf-8?B?cVBwR2crL1VuWHdybDdYZ3RUMmpyenRqbk9hMW4wWlBsbUdkMnc3KzZIcFZo?=
 =?utf-8?B?QVZHbkkrZEZ3Q0o4Z0dhSmsxelZmaTQ1aVlMS2o1bStYMkdSMitaZGZPOElp?=
 =?utf-8?B?R1BoOTA2QVlSWjUyNVE3OUIzdk1nQ2FpQnNqbzdsK1JCN1pKZTNNaU1SNVly?=
 =?utf-8?B?dlJkdW9QZWowVS9LemFLWEh2c2ZrVFVzVVN6UHRzN1FsV3ZLSy9jZ0oyTWtx?=
 =?utf-8?B?TlJmWGtPZjVnM0FYdjEwaXA5WWRROCt0TVRqWnQvVkMvYnVHMndPYzhCM09F?=
 =?utf-8?B?bHB1VjN0bVJkbUVzY3N5YVNjcjNPWkZ2bjFpemhjUTNzc2FkSnFVTWFSVmJX?=
 =?utf-8?Q?htj31alIeylHA689NOw/VMF12ri6LFJLOF3ag=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7730.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2FaV0FmallsSjBIcG1qMUhkdm0xcW1VcDdEWDhpMm5nRW8zN1pjMzJVc1h2?=
 =?utf-8?B?UnZPNFFYN0FwYzlZSTArYVZHODdWbTZYZHpMT3ZmdE5iRG1rQkRHL3daZ0dG?=
 =?utf-8?B?ZG5rMTRIQkZRcW5WSFUvYmM5alBUWG9qekd1NDMyczczYVZlOU83emdzeUVp?=
 =?utf-8?B?UXFkZVI0UXZkRG5ocVpqbW02SmNRMWNueDdRY0VxeXJrVlBhenM0YUkxUkVx?=
 =?utf-8?B?U2xoajNMdmFHZmpXZlFMbnJVMGZ3aWdDME5QM2lUeHpnaXBuT0ozOEFMZ3ZV?=
 =?utf-8?B?R2t0RlE1SmZVMytsaldsNTBlU3lLbW5sbEQrRmYzRGZnYmJ2a3YrcWxhRG9T?=
 =?utf-8?B?dHF4dHdOdGFOV2FFdWZQYklUN0ZmS2hLRS9MTHF1L0hOc3hMU1h2UVpBOEgv?=
 =?utf-8?B?a0R0RVhzT2dqZUhUTFBOOHlFbXNkdXV1Y1c1NFBYWUw3QW91dFpWT3lGNWNC?=
 =?utf-8?B?eXJOTzl5ZzJESnJ5dUFTL3V3L0xEdHlIMFBuVVBOZVQwSllrMjgrc0kwTCtm?=
 =?utf-8?B?ZzI2NVN1ZVZVcVMrQ1ZuNkVwdFZtaHhHRGNYbTE0a1NlNkJXdlVXU29zQjl4?=
 =?utf-8?B?d1FLS0IyRk0wWHNiYko0b2pQZ3dqSUQ0aS8rTkFEUWhRTWhzeTBXZ3ZzK0VV?=
 =?utf-8?B?OTZqUVpmTDJGc2NqeVpiMEpRZ2FsQVpLOGpNNGhtb05HL1lEbzFBMWNQdXpZ?=
 =?utf-8?B?ZEc3VTJiZU0xMEhXREFkcTJIRFVIN0RGOUpIZzg2anV3bmhxeDVVMnJEbmkr?=
 =?utf-8?B?M09HcEFDS21oRXl6TEhtMkE2eEU2MElTR2VOR1VtRStyMDRIV3orNm1iZW4x?=
 =?utf-8?B?dmZJemVLaVpHYkJlaXhIRWc3aFhsTC9BdnRCUWRHSWV0L29KMFJLSEZFQjVs?=
 =?utf-8?B?TGJaZ3ViQlFuUjNpM1pYS3RjUG5lV2k1MTBVUEY2bmMrL01vUVIwOU9EU1Yx?=
 =?utf-8?B?bVpkdVlzOWI4VVVMa2NEZ09adEE3QkFCT0tXYzE0ek5LamkyYk9nMSt5dkp1?=
 =?utf-8?B?ckhKL0hUT2VzbWh4VzJqR0s3NTQyNTl3WW9kOEpXbS91MzhmWm9xeVNSOExs?=
 =?utf-8?B?Z2tKditrNndtVElPQU54UWpIN3l0WkxFc2lHN1g5a0N0cENNNmhJREhDM0Ey?=
 =?utf-8?B?c0FDdVlTYzhMUVVEd2lBWWRaSXJoOTRVUUJ3bGNEdWdvblVPc09VSWhjRTBW?=
 =?utf-8?B?Y01wSmVCM09EWTlvb0xjNldqeFY1OGJUdTZzM2FjV1orM0Mydm5Id3BMbzZx?=
 =?utf-8?B?MGZDTGFwQlFRZ2ExSHVwZEIwM2ttVkJTc2p4K0NPRlI0VWoraSs2RGxkcC9k?=
 =?utf-8?B?bDdMbE1wMytOZjhZU2VlNkJLVExEYmZlbVZ1QTlJclgrNzh3SlNDa09RYyth?=
 =?utf-8?B?bjBYcjlFL1JLSlQ1OEdReEZjRlo4SlBmc2paNmlsYmU5TFYzOUZsYnI4K1RW?=
 =?utf-8?B?N1FZNmc4eEZtT3ZMOVNQQW1aY0c3eVgva2RSd3l5bEw0UWFwRHlVNjlpY1pK?=
 =?utf-8?B?cjZJbzNLN3hCR2k2YmFQQzkrVUdNTTJhNCtzZnBHaXAwVUtDQlk0cHNsYUVm?=
 =?utf-8?B?bVgyeWxnRE5lL1lYc3NEUElKMy80NjhnY3lCUzFMcEtMLzA3ditIWmlPSHl2?=
 =?utf-8?B?U3plQXFBU0tNUTgwWGhST1FQWC9JMGFhbGtYZmVRQ0l1Vmk4YXkvaUhmZHR5?=
 =?utf-8?B?U25hZU5kSXRwQ3djeEd4K3VERjFrQjY5QzlUYkJHaXJjWGlsRnhqTWc4WUc1?=
 =?utf-8?B?T0NhdGpvVnM3WWVHTHBCbnF0MkxyYnJyL2ROTnZreUxHSWZYWWtKTmNNaFNM?=
 =?utf-8?B?TGtwekd0UnhNS0gzOFdSOFRFUkxqUWNRcHF0blhFYlQzbUo4QUx4azBPaHpU?=
 =?utf-8?B?UlJ6MGwyMHRjR2NvTTBVRXhzUURLNjhTcEdOQnVXaEJoZGJNOExZWG1SVlFs?=
 =?utf-8?B?aFM1SDVvOEpFTFEvcEVKcmpiaEppQzVKV2RmZFhrdWx4VjliVnFjN2dhTm1q?=
 =?utf-8?B?V0tpT1pEbWNlS0JBeHorbEVzcmNwZmFKcHBqVHJFYlE2Yys0STBuaU9CZlNa?=
 =?utf-8?B?aUJSRzdyeXMzYWQ4Zjc2VmJuWGFYK1hKWG5BUmdtaWxOajRJbEhKNHpSSjRv?=
 =?utf-8?B?S2NYR1FjaHdnL0FzUFp0bCs5aDZKc0VyM3ltNUI3QSt1NHpaaDZ3Y20vNmVG?=
 =?utf-8?Q?eol0QPfuzDTThFiDkcUTNnUR38mF4T7B/ZrNs8Go8p7h?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23BF557E732C464E919827774DB4BFD2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7730.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b04bec53-33ab-4282-bf46-08dcc5cc31c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 12:39:57.8521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NhpE+Ye7M5BDyNO/c7sYFOF2XM/U9o3ASd/57Nu3ghhAkeenDyimkh+ALjgH6qaPRKHJdH5SoW5h21QAQa7eWv/yISGHeM27W9eK5rvnfkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4536
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

SGksIE1pY2hhbCwNCg0KU2luY2Ugd2Ugd2FudCB0byBiZSBhYmxlIHRvIHdha2UgTE5MIGZyb20g
c2hyaW5raW5nLCBJJ20gdHJ5aW5nIHRvIGFkZA0KbG9ja2RlcCBhbm5vdGF0aW9uIHRvIHZlcmlm
eSB0aGF0IHdlIGRvbid0IGRvIGFueXRoaW5nIGluIHRoZSBycG0NCnJlc3VtZSBhbmQgc3VzcGVu
ZCBjYWxsYmFja3MgdGhhdCBibG9ja3MgdGhpcy4NCg0KSG93ZXZlciwgaXQgc2VlbXMgU1JJT1Yg
aXMgZG9pbmcganVzdCB0aGF0Lg0KDQpodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9p
bnRlbC14ZS94ZS1wdy0xMzc3MzB2My9zaGFyZC1hZGxwLTYvaWd0QHNyaW92X2Jhc2ljQGVuYWJs
ZS12ZnMtYmluZC11bmJpbmQtZWFjaC1udW12ZnMtYWxsLmh0bWwjZG1lc2ctd2FybmluZ3MzOQ0K
DQpNb3JlIHNwZWNpZmljYWxseSwgU1JJT1YgZ3JhYnMgdGhlIHhlLT5zcmlvdi5wZi5tYXN0ZXJf
bG9jayBkdXJpbmcNCnJwbSByZXN1bWUsIGFuZCBsYXRlciBpcyBkb2luZyBtZW1vcnkgYWxsb2Nh
dGlvbnMgdW5kZXIgdGhhdCBsb2NrLCBzbw0KdGhhdCBhIHRoZW9yZXRpY2FsIGRlYWRsb2NrIHNl
cXVlbmNlIGNvdWxkIGxvb2sgbGlrZToNCg0KMSkgbG9jayB4ZS0+c3Jpb3YucGYubWFzdGVyX2xv
Y2sNCjIpIEFsbG9jYXRlIG1lbW9yeQ0KMykgRW50ZXIgc2hyaW5rZXINCjQpIFJQTSByZXN1bWUN
CjUpIGxvY2sgeGUtPnNyaW92LnBmLm1hc3Rlcl9sb2NrDQoNCk5vdywgTE5MIGhhcyBub3QgZW5h
YmxlZCBTUklPViAoeWV0KSBzbyBJIGNhbiB3b3JrIGFyb3VuZCB0aGlzIGZvciBub3csDQpidXQg
bW92aW5nIGZvcndhcmQgdGhpcyBjYW4gY2F1c2UgcHJvYmxlbXMuDQoNCklzIHRoZXJlIGEgd2F5
IHRvIGF2b2lkIGdyYWJiaW5nIHRoYXQgbG9jayBkdXJpbmcgcnBtIHN1c3BlbmQgLyByZXN1bWUs
DQpvciBwZXJoYXBzIGF2b2lkIGRvaW5nIG1lbW9yeSBhbGxvY2F0aW9uIHVuZGVyIGl0PyBJbiB0
aGlzIGNhc2UgaXQNCmFwcGVhcnMgZnJvbSB0aGUgdHJhY2UgdGhhdCBhIGJvIGlzIGFsbG9jYXRl
ZCB1bmRlciB0aGUgbG9jay4NCg0KVGhhbmtzLA0KVGhvbWFzDQoNCg==

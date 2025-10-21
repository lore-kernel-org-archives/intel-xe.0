Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D625ACCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 16:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804FB10E610;
	Tue, 21 Oct 2025 16:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLfuV5Qy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8AE10E610
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 16:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761062990; x=1792598990;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QPN5Oo3e5sZvsjHmuR5woiBlKRvUsbjFQsawyzf6vdI=;
 b=kLfuV5QyYXGOjaPbWSOBQP3CPtVFuvFzqd3+1uJXz4nkVHX6TNhwoCy1
 P+FLgHf1ZfzswRcsS1Tvw/TmT7Xh7BTFmaElfRGn+McS6wSi7LTSAYk6U
 IEcVm/24Y4G8DTIXoRnxHRmAI7zi4BKjtjk+aeVrfL9uv28Hr4/y1xm2Z
 Q+JgMvMcyonrWjS5wx09XMYxlts8m8eTImaAj0l5oa8YXo2GqhI7JbDAf
 AYC6976hNlVk3GYJX5yT4ZuxJPH6htXr+HcW20OJF97NHvRwh4vNQWX4r
 DkmHuSE3dJABGUmzMXArO/TbHmFG5nd6Bn0yv8ufCVjDNPK0Y1vN6a5vB w==;
X-CSE-ConnectionGUID: 17zrNz5UTBa15hg9gVgtRA==
X-CSE-MsgGUID: LpTcWLkkRXChQr9/RhhHeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65811234"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="65811234"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 09:09:50 -0700
X-CSE-ConnectionGUID: eY1GcK92SmyVib4tM58X2A==
X-CSE-MsgGUID: sr3m73SxQpum+CFm3s73hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="183486187"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 09:09:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 09:09:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 09:09:48 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 09:09:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xv5SSv43s0/7tW5nJ6UeHbZE54yzv0hLskNHtmJCOKnv+ZBfuZG7THf4MyrWygiGwtTtOvyh8Bm88U9/yQSC3eSmnZVfkfgJM6wdTIXGWBrrkx27KgVq1RnonV2tql4AHTlerz4EVlbGfIAGWrgNCL17QXCw6vyaNbbIB0+A4bQ6ldOLGqCXgyphS3/+xl8Iy2coKJ9yOLodXF08B2HsXya7mQFJkJ4JNJQBVvDJTPjn++WNAB8gWjcd+dplhoSiIsRrYjmWozdth4IB0pugIRnCWG+/+WxzmlFiX/tdptN28MJKXgJfeTqYto3ZkgX8AYJ4i4Ydgk+t/4XXpbtU6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPN5Oo3e5sZvsjHmuR5woiBlKRvUsbjFQsawyzf6vdI=;
 b=QhgB3APNGqlkAJuJRVvbvUYCmZ/fwSpMlE8NYqG5OQ+OH9Rw02XoHIWjFIycojE+9rByMXOiLez/umCnhdZFVEumS7J5vSK0w5DfSgSY6htzMXKGXRAm2Se6mwjQAvfQFTFuxA/YMmbdYY7H4ynGUKBayyXYZv4mLL2tmu4y7mC2YLgw0g0wbYm/opBsYuH7CqePdaeT4b5QhsNRldRpEFUfWJN9N3URGSnsf9y24beUMWnHF+smNYMNXA+91ysCnZoZEtHu0CBQEtdxlRAFueS+KYo4Q6A59yZW8eEgLjCBfmqcFcaxHl1HQEQlLV8G47bz3uhD3Ptkd5xlxzqfQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5447.namprd11.prod.outlook.com (2603:10b6:208:315::17)
 by SA1PR11MB6709.namprd11.prod.outlook.com (2603:10b6:806:259::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 16:09:45 +0000
Received: from BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::ad51:b35d:1aca:726e]) by BL1PR11MB5447.namprd11.prod.outlook.com
 ([fe80::ad51:b35d:1aca:726e%6]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 16:09:45 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH] drm/xe: Fix stolen size check to allow equal WOPCM size
Thread-Topic: [PATCH] drm/xe: Fix stolen size check to allow equal WOPCM size
Thread-Index: AQHcPvBCMW8REWmds0iwCVLgCFUGe7TGCYeAgAbCK5A=
Date: Tue, 21 Oct 2025 16:09:44 +0000
Message-ID: <BL1PR11MB5447E7EA697902D7F6925F35EAF2A@BL1PR11MB5447.namprd11.prod.outlook.com>
References: <20251016225506.2256127-2-shuicheng.lin@intel.com>
 <466c6ba9-7bdc-44b0-bdcc-89fd51150f03@intel.com>
In-Reply-To: <466c6ba9-7bdc-44b0-bdcc-89fd51150f03@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5447:EE_|SA1PR11MB6709:EE_
x-ms-office365-filtering-correlation-id: 4ef85205-3da3-4719-f37c-08de10bc403c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VXd1VTZLa2JkSGlpeU1nb0hyVW03UlVLTTZSUTVlRWd2R3FsOGlnejdkUkxr?=
 =?utf-8?B?Skd3TUdlc0NGaVBMenJuWGYvTVJIMi9wK2hkNis1b0xKZElCS1ZCQVBhOG5X?=
 =?utf-8?B?azFMb3U1dlVpSmNONnlsTWovdi96MUVPbkRPYWEzaFpDc1pIVXMvYjNXNGty?=
 =?utf-8?B?eHMxV1JPNW1PWHVGV0xPQlFjM05mN1lJSnpIdHRCTzkyQVBmc1FPbWdJL2tE?=
 =?utf-8?B?ZllCS1g4b3ZXQ3E0bUF1OThxdjcwTDJpNG1lV3ZHRzM2K2VKTkIwUzlnNVFM?=
 =?utf-8?B?WXhVZ1VTekhxUDVFcFV2V3l4akpkTlZCVmhDZXNHQjBvdmgzcVJEWEtzaldh?=
 =?utf-8?B?VFc2TTdmQk1Ub0FIT2tUeXJxL2RLOVo2OEhYK1ZCdFY0aVlBVjhWaUR2a1N3?=
 =?utf-8?B?blkrM25TbWZ2Y2hvZHVpaVR4bEZCZWp2akc2RTR1UVNBYStqeFQrZitDRGEz?=
 =?utf-8?B?OGl1Z2dNYmx2M3NjYURlbWtzM2M3RXpmUGgzalhiTE9VaThaQ1MxdjV2QWVN?=
 =?utf-8?B?V0JTMzYrSEpHTmxFNnE5dWpDOGRManJZN1k1Vm9nNmtSWjNjL3kzWFJDSFRy?=
 =?utf-8?B?Wm9xdVVSeGtIaGlvQTQ0R3pHZkhNeWtUaml0Y0RvUEhqMEdwZkZRaXJFbG9j?=
 =?utf-8?B?UW1mR3JpODlWNFVKVVd5WXRtc09rZS9WN0twZzNqUnpzNjVVWEkvU3htOUQr?=
 =?utf-8?B?WGY0MDE0emFvQXl3QnBHNVJrNStYSDVYMmMrYUdIeGZRUUZaWUJHTWhiMXQz?=
 =?utf-8?B?U3kzOTdnbDE1b2xHbk5kUFFCaFhXL0lpR0ZpZUN4VlpRRmJaZERsdlRRSVQv?=
 =?utf-8?B?WDdjMUFoclBmWlpyUlk1UzFhVW8rNUtFQjZPbjhNcDZNaUxQaTBDVnRIeEZu?=
 =?utf-8?B?cmVBckx2Skg3OWVuL053SGpYZ0taQjlLellCQ2l3aCtUWlhtT3RHU216aTNv?=
 =?utf-8?B?cXExKzgyN1o2RjB1elZLWlZRMkpWN3lxN3ljNWRtR3ljZHBkV0pCcXh3NG80?=
 =?utf-8?B?emM0UFZOc2piNDdXQ3ZzWm5ja0p0NDdaU2g5UC9oNldnWmFYVG8wdnZibXhi?=
 =?utf-8?B?SSswTXkzaWRaU3p5RkhyY2QwbWtFZm5wM1hINnNDc0JmcXF4MDg5S2dzSGpQ?=
 =?utf-8?B?RFFOZTNYaW93a2RJRUZhM0pDZTM5Wnl2V3UvNTQvSnd2NXRTTzlrTHNCR0xV?=
 =?utf-8?B?Z3ZYU295RTBDZTJpeFZwdjJQdEFpNWZqMHB2aXVoYnRqTGYxN0VBRHpMZlA0?=
 =?utf-8?B?ekhlTFcyQ2p5ZlFFK2R3QUhVYUF4MmlKbWtzZHorNml4SFhLT2J2MUJvazRj?=
 =?utf-8?B?dklYQ1ZBQ3dLTkYrMmVuRUhqTCtEKy9USFM4QU5JNVNBVGNGM2duckFmYjFk?=
 =?utf-8?B?MjlxWUxFVEJFakZIVE9TOGJsOCtrdVVpeGJhZThSblV2M0FKdXMvQ3FKcndD?=
 =?utf-8?B?NGhMaXc1NFNLajdIWmc2Z21XOGsyL29KUU44Uk94U3JXNS9qeDFqTDNaMjJY?=
 =?utf-8?B?RGlQdHM4blc2Y1NGcnpURWhEaTBxdEhYL3h2L1JKRFRsN211djNlUFp0ZDMx?=
 =?utf-8?B?L2NTSU5FNlVFZEtYSXNCSnYwOEovZW1BYnZFZWVFbVNLZ3FFSkFZeWJnYzNC?=
 =?utf-8?B?V0o4M3ZsSVJueEVVUVlmbGtlWTl0VXhsUzB4LzBwcmN4bENtQjZZTDRFb3VS?=
 =?utf-8?B?dW9FdmVYTmRLSFJHSzVoSHo4NXVLVkQ1VVRWSGdDS0ZWUk9lR2E0VTkrcEJL?=
 =?utf-8?B?cGk4TUpmQTU4TDhWdGk1RVFFWm1UUENmNDlUNlNmVXFPMXJWdzZVakx3T1Jw?=
 =?utf-8?B?allDakNXeGNVbWFlWDZ0d2xuWjVzYnFFd3J1Y1dwTjlsa0IrZE92KzBabWRQ?=
 =?utf-8?B?MkU4Z1hBbFZ4YVpxejZnRm9tc09SL3F4RFl3RHlIWkxPSURhUFhQa1d0R0VS?=
 =?utf-8?B?c0lEaDdxS21zWGtjb2ZnS3ZUbjFsSzlXS0hqY1JtTm1wUVN1NzI3YUw2dVZT?=
 =?utf-8?B?M3JhSU9FbFpnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5447.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHFuNjFXejd1TCtOakR6Wm9lUS9waTI2a1pwMWdwZ1hGcFVzUHVEaVBjbE5z?=
 =?utf-8?B?S2hWYXJJb1FlWk4veG5FdTJTa3hYSTg4OVRuK1FYUFFVek0vdW4yZDB3SC9W?=
 =?utf-8?B?MVRwRkROeWcwa01MWDd0Sjduc0VRUXN5S2I4QzZjUVo2Yi80RzdlMGxLMVRy?=
 =?utf-8?B?U1ZFL0E0V3pzSTdhb1FXSFlzTmtVdnFCRGNaUTBYS3I0d2NheTJvQ0llR2E2?=
 =?utf-8?B?TEs5cnppTm84UExER2lycUZjQ3FLZnNOb2pIMkQraS9iY0xNUHFVT2c3Tm9v?=
 =?utf-8?B?dDB3eXptZ1JuQTJVWEJhVDd6b1dPZ1RrbDlMS0EyeUJSS0tNS0pNcS91M3lT?=
 =?utf-8?B?aC9LQkc0OVJEeVF6bGFTWWZ4Y0JvRDVzZXN5eGZrdnJIa3VoUWVVWVZ5RzdF?=
 =?utf-8?B?by9zMnpMRnBLVlhhbjJDNzFvVTJwUXk5WVJuM2hNMTN6b3Yyc2FBSXlwdDd0?=
 =?utf-8?B?dEhkZFVLRi8vNlQ5S3doQWFIcEUvM1AyN3RPNmNPeE1pNjVzcHVoTGlqM1E0?=
 =?utf-8?B?bG44NnBmbHJ2ZFlkNmdTTFBPend5SjdqeWlTTTBnS1ZEMGJTS000M2NLNWdy?=
 =?utf-8?B?YmdZUExqejNNS3A3OENKcDlENGtuMlNRWlBQbk1tQStoekR6cFNHbDA5Tkl5?=
 =?utf-8?B?SzZDNERkcHNpM0kwZnc3OE9WVVZQSFQ5a1BiaUh5bEhjZXA2QUFPbmZ5RlFy?=
 =?utf-8?B?MjVBVzdiTStwTUZRbDA0YXhTNzJXcElNUmx1T3o0dnpnQ3hkYkxreGlieTRM?=
 =?utf-8?B?MTg2V2FSSU5hZWlqWHlBZFFXT01QOWRFR21BOUdHTjVQK002RHk1OWtDVVE2?=
 =?utf-8?B?bk5NMnBLeXNTSDZNZEZsZktMMmVCOVFzSzRkM3BsRjNOU0gzRDRuNVI4aVA1?=
 =?utf-8?B?OFFzNTRIRUFnM0VDRGoxWExUcnQ4WW5lRkQvdlh6YURva2ZpUUhqaWpVMVBV?=
 =?utf-8?B?UFB3STZLY3hGNFYwdUsvMTJVQnQ4akJMV2J1WC80K0ZaN3dUTFNXZk9kUjNP?=
 =?utf-8?B?RlVpMklJSnRlMUNDMW8rWUxadk9Ba2E3aDhMaVMxcEpUcmpqY1M2b1A5MGY0?=
 =?utf-8?B?R1dYSmlDZHVoVTFDSHZWQWwwbm13R0RxWm50dVpYR1IvYWduSUFaYXJzcmRq?=
 =?utf-8?B?eGRrd0lBR1R2OWxDMTZ4Zm9QblNqdXpCMXhhU0hOL3QzanhvbEx1SUJJYnNy?=
 =?utf-8?B?MWhlcDBDK085OVZlNzFIZWJNejU0QzFjWDBmM1N1TmxydnAxb3liQW5BT01O?=
 =?utf-8?B?SFNnVUtLeGJhQTZIdXlRUFd2aWhIL00yaWZ2eGdqeURGcWc3NmdmNjRRMUpo?=
 =?utf-8?B?clZ4RDFpME8ydkM2SDM2aXlQMXlKTHF3Q1o0dUM1N05uWkFZZVlrenNsSmNJ?=
 =?utf-8?B?c2wrK2Z6bklYOVpFQW80OFUrVE9YVEFYSU0yYXhvZzl6bEZYbXVmUkh1cW1D?=
 =?utf-8?B?cXU0SEFsbXY4VXRxKzMrRGNnQVZFdGFVMzUxYnZ3OGluL01EYjVkajQxUHJ5?=
 =?utf-8?B?b0FYR0hrVXRSUzhLenloaFcxMWRwZmx3ck5wY0pGaWM0K3ZhVTY4OG15TENX?=
 =?utf-8?B?SS9YelkvQWxZUXUxc0M0bUdlYjhZV3F2NmtGT2tPS095NTJTVGxPRElzZlNp?=
 =?utf-8?B?dUpmYkJObm84UGR0YnRDWjdsV2JETnJBRlpyS0NrNmlNc0NBWHg5cEVZM1pN?=
 =?utf-8?B?RlJSM2hwVFlTUk5YL1FTODBsTUgydmp5WFV5d1llZVJiNHJ3UkZRQlJWNzcr?=
 =?utf-8?B?aDdnVUhlMnZmbEdza3dNQmpnVllyU3ZEdS9HYnUwRGV4VjlQNXl4REcyNFdC?=
 =?utf-8?B?Z1NvdWVlMTA0ZTJpMTFEUWNWY1M5RmprSVV4K2JTS1FuWU9uSUhIcVQxUFBs?=
 =?utf-8?B?blk5SEtzZjJvekJQRlhwczNQL3gzMGVXZytOYlIwbkZtN2tYMFRvRER1WHRV?=
 =?utf-8?B?bnVYUGVEc1BkdTkvTzI5ZXZNN0RsbS8xL3B1c3ExeXlod0diWjNQZVBvdTBJ?=
 =?utf-8?B?ZUhaeEdlaStWU2tIMnh3OUFvaEFkdjJQRG1HaUlDQjFHLzhxcTVtUkx2U0d5?=
 =?utf-8?B?MUNydTZiaXZKYnIwUE5aRlVITlplMHYxeExhWE11cVBhLzhmSHNUcWxSMEtD?=
 =?utf-8?Q?RJLKVMTGuOdaazXJJKz3WYrSy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5447.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef85205-3da3-4719-f37c-08de10bc403c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 16:09:45.0542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 14KRstRax77NHUUrlQ07A7KNpC274PMGmmR9k8SG+zXYVwKEXKXYXb5QgKU2wa+af8oIbVETfSF+l9b/qiq4MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6709
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

VGhhbmtzIE1hdHRoZXcgZm9yIHRoZSByZXZpZXcuDQoNCkhpIHhlIG1haW50YWluZXJzLA0KQ291
bGQgeW91IHBsZWFzZSBoZWxwIG1lIHJldmlldyBhbmQgbWVyZ2UgaXQ/DQpUaGFua3MgaW4gYWR2
YW5jZSBmb3IgeW91ciBzdXBwb3J0Lg0KDQpCZXN0IFJlZ2FyZHMNClNodWljaGVuZw0KDQpPbiBG
cmksIE9jdCAxNywgMjAyNSAxOjU1IEFNIE1hdHRoZXcgQXVsZCB3cm90ZToNCj4gT24gMTYvMTAv
MjAyNSAyMzo1NSwgU2h1aWNoZW5nIExpbiB3cm90ZToNCj4gPiBPbiBzb21lIHBsYXRmb3JtcyB3
aXRob3V0IGRlZGljYXRlZCBzdG9sZW4gbWVtb3J5LCB0aGUgY2FsY3VsYXRlZA0KPiA+IHN0b2xl
biBzaXplIG1heSBiZSBleGFjdGx5IGVxdWFsIHRvIHRoZSBXT1BDTSBzaXplLiBUaGUgY3VycmVu
dA0KPiA+IGFzc2VydGlvbiBpbmNvcnJlY3RseSByZXF1aXJlcyBpdCB0byBiZSBzdHJpY3RseSBn
cmVhdGVyLCBjYXVzaW5nIGENCj4gPiBmYWxzZSBmYWlsdXJlLiBSZWxheCB0aGUgY2hlY2sgdG8g
YWxsb3cgZXF1YWxpdHkuDQo+ID4NCj4gPiBGaXhlczogNjUzNjliOGUyOTYxICgiZHJtL3hlOiBD
aGFuZ2UgcmV0dXJuIHR5cGUgb2YgZGV0ZWN0X2JhcjJfZGdmeCgpDQo+ID4gZnJvbSBzNjQgdG8g
dTY0IikNCj4gPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUv
a2VybmVsLy0vaXNzdWVzLzYzNTkNCj4gPiBDYzogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRA
aW50ZWwuY29tPg0KPiA+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+
DQo+ID4gU2lnbmVkLW9mZi1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5j
b20+DQo+IA0KPiBMb29raW5nIGF0IHRoZSBsb2dzIGZvciBQVkMgaXQgaGFzIHByZXZpb3VzbHkg
bmV2ZXIgYmVlbiBwcm9iZWQgd2l0aCBhbiBhY3R1YWwNCj4gdXNhYmxlIHN0b2xlbiBhcmVhIGl0
IHNlZW1zLCBzbyB0aGlzIGxvb2tzIGNvcnJlY3QgdG8gbWUuDQo+IA0KPiBSZXZpZXdlZC1ieTog
TWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiANCj4gPiAtLS0NCj4gPiAg
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fc3RvbGVuX21nci5jIHwgMiArLQ0KPiA+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV9zdG9sZW5fbWdyLmMNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fc3RvbGVuX21nci5jDQo+ID4gaW5kZXggZTM2OGIyYTM2
YmFjLi4xYmRkZWNmYjcyM2EgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3R0bV9zdG9sZW5fbWdyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3N0
b2xlbl9tZ3IuYw0KPiA+IEBAIC0xMDYsNyArMTA2LDcgQEAgc3RhdGljIHU2NCBkZXRlY3RfYmFy
Ml9kZ2Z4KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiA+IHN0cnVjdCB4ZV90dG1fc3RvbGVuX21n
ciAqbWdyKQ0KPiA+DQo+ID4gICAJc3RvbGVuX3NpemUgPSB0aWxlX3NpemUgLSBtZ3ItPnN0b2xl
bl9iYXNlOw0KPiA+DQo+ID4gLQl4ZV9hc3NlcnQoeGUsIHN0b2xlbl9zaXplID4gd29wY21fc2l6
ZSk7DQo+ID4gKwl4ZV9hc3NlcnQoeGUsIHN0b2xlbl9zaXplID49IHdvcGNtX3NpemUpOw0KPiA+
ICAgCXN0b2xlbl9zaXplIC09IHdvcGNtX3NpemU7DQo+ID4NCj4gPiAgIAkvKiBWZXJpZnkgdXNh
Z2UgZml0cyBpbiB0aGUgYWN0dWFsIHJlc291cmNlIGF2YWlsYWJsZSAqLw0KDQo=

Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D44E9B265
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 14:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A4010E300;
	Tue, 24 Feb 2026 14:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ueyx2Yzs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3844210E300
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771941901; x=1803477901;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=juD7LI/ygKogvZiF/dLxhfVR11rxbyvYxjoKH7BZV0s=;
 b=Ueyx2YzsSovTIiyvs6FH5IZiAeu2bjk3QfCyP5o6zcpxbSfa8N0SCq+J
 zUK57kTLw+irxYk81VXWysnlT61gI3coLurl0ut721u0qqf0qijj02xJl
 yA230w9W9+GwMcYF3QE+mDdPS6d7XJ7qyk7wkSrkEUwldOOnCbmIUna9G
 8qB30dL3X+BX0wLVsqNphXTbVB1uKMvj5T0rNWMhPdtKlm2jtzhlXMPfP
 a6dhzdKPcHqAdAPBMDVlTzAGwb0K6WSHjEbwbNuqR4hJv9CLyyNZzEYYv
 K1+EsAydIWuEZharcGxoUAb/QBy7hSk4O2KFHm21uww0/QqzsE+2NCYaX g==;
X-CSE-ConnectionGUID: SJg95m7XQdKPPFKUeVk6qA==
X-CSE-MsgGUID: e81BZly7S9Gl3hVlBQKfLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72929023"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72929023"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:05:01 -0800
X-CSE-ConnectionGUID: nzvRm+KsRrKoLG4JZnkuvQ==
X-CSE-MsgGUID: Bvflc8fTQUSodrIUqTl+pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="219386953"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:05:00 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 06:04:57 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 06:04:57 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 06:04:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKuInHP5KHtjKNv7x1GfoCTrsBHWv2tGlxJcg37V0ofDnYI6Emcjepc2hL+EEWBiR0LWen8B+odYiwRIUrxcy2qmt98fFQR1wL+0PFMk5a/AYp3Gyp7PThpHtb5Jns1d45QZwKQZXBVR3P7egR6ezn3jjIcnLzzq0n2faCg2ckrWG5SDHcPAmyPQSwf1x16BCcgqP8sg60fFFnActrvFnCmYBWc2trn4B/WaAyzZuCeHLO6w8Ajt9CoivRHojBaAgmgskF3febrS5toJ5Thw/c6tQXkelu8HxShlxIywjwDtiDLeJ8zmIK+s6idYscGLjfRnu6Ku655zyLzNRaCcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juD7LI/ygKogvZiF/dLxhfVR11rxbyvYxjoKH7BZV0s=;
 b=v3325px86e3mkUFjtj8xFS4qHrwBn7/VuIIWQnMzFkWqzC7WuY96nnQVUiYCry9HAd0RsBRhXZR3rQdoWCBnUMK6ZhU+EjVmv36xLHJV3u6gR0YasjqIaCLwGUxs6a8NByb8DjgbpVE/P8+E5K3ZPtc3C3XUp3KSvSou/HIQu5c1er9z8QGtEgDiHzCedyTrFD+t+kIE6aRx6kTDqWFU/OzVH/xieAU+/7kTKnDPKJuy+4zKUNGkErwhAATsx8kXwGnOefIosTzUAX0hb2WxaHH0AHc7lL5QgJaQoy78HSId8a91lnUDMQRSkhhqc+7Zjh5dFJOdK2zwM7Z6sxZmHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MW6PR11MB8437.namprd11.prod.outlook.com (2603:10b6:303:249::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 14:04:53 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:04:53 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Zhang, Carl" <carl.zhang@intel.com>
Subject: RE: [PATCH V4 3/4] drm/xe/xe3p_lpg: Enable L2 flush optimization
 feature
Thread-Topic: [PATCH V4 3/4] drm/xe/xe3p_lpg: Enable L2 flush optimization
 feature
Thread-Index: AQHcpYFJxYlYrKp4OUuCTu5s1qhlLrWR3YYAgAAA8wCAAAEHAIAAAl8A
Date: Tue, 24 Feb 2026 14:04:53 +0000
Message-ID: <SJ1PR11MB62045FA05951557681C73DE48174A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260224113147.1656939-6-tejas.upadhyay@intel.com>
 <20260224113147.1656939-9-tejas.upadhyay@intel.com>
 <cb539bba-fbcc-457a-9c6e-f2200b02949d@intel.com>
 <SJ1PR11MB6204275709D0270F9B4C7E3C8174A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <fd59e38b-5c4b-4b04-bb9c-26f14509986d@intel.com>
In-Reply-To: <fd59e38b-5c4b-4b04-bb9c-26f14509986d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MW6PR11MB8437:EE_
x-ms-office365-filtering-correlation-id: 4caf27a1-69c1-488c-20d4-08de73adaed8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?b3krVkZXNHdiSHFVUmJJcVBFdHdjVkRjUzVrRWV5U01aZkJpdHFkQ0tiUHFK?=
 =?utf-8?B?Z2Ewd0pnQ2tLM2pGOE9LUVR2SzZnOTRGMGFTZml2M0tEcXoxanN2a2RqV3Vk?=
 =?utf-8?B?eG1jK1htYVFpemxxZ1NNWjd2WCt4anBXaVNNa05CVjAwWktpVFdqUHp0OUtp?=
 =?utf-8?B?d2NwdFV6S3VsR3EvU2YzT2cxMXZmUXRxd2ZUbWxKaEFseUsyb2JGU0hhWGJo?=
 =?utf-8?B?TVZOK0VvSkFpTHRzcjlDaTBidXlVcWszcUJpbjFUdmhNWTBrdWkwQ3RLOGky?=
 =?utf-8?B?dkphaFRxT0lkRWF4SDExelhtT0hGZ25jWWFqUkQvTk1MR2pXR1RUVGt3cGpI?=
 =?utf-8?B?VmpNeEJUK1pOM28weDVRSHNCVGl0NTZzc2ZKUklXekZSUlFZaUhCZEZwbjl1?=
 =?utf-8?B?L3VsY25lSkZIQ1ZnVXQ4SHlKV0JVbVJlUHdYLzRXdGMrc2JLUTVJSS9BcWFv?=
 =?utf-8?B?ckJyUGpmTlc4ZXZmZEptRzEzVjZjdTBodi92SENWemhjd1YvVEF6cTYrcEFa?=
 =?utf-8?B?cmtDenY2OHppZ2VmQ2llWUxuUkRoblkweWRBV3dOdTIxY3B5OXBPR1Nzc2lH?=
 =?utf-8?B?TkdwdlE1dlFnWU1iYzlTVVlEVnd4QnBrTHFCbk5Hd3ZFZm5mcWVQUURqZVFz?=
 =?utf-8?B?c2FVcmNwS0VqRkZlbnBTMEZmVmZ2dWFHTml3clpXbUNXUXVWU0RiRW90ci80?=
 =?utf-8?B?YURtdzBqOFlrOXM2MTdFSFNITURGcmFSUnk1eDVBSVN0TnJEbk1SR3NCRU52?=
 =?utf-8?B?MkhsN2pVYjJTUDRSV21YbHpOYko0dGZUWlA4M1ppY0pqWFV1YUppR1lKZ2dX?=
 =?utf-8?B?SHN1Y01qNGsrSEgvSHdTN1gvT2h2RGxaQ3Z6WStrTU5JK3JEbnAxampqWTVw?=
 =?utf-8?B?UVAzaGVmVjVMY2lEajFhUms5cmtRaXBZaU9mZmdXWUtiKytBcjV4OHZTKzZN?=
 =?utf-8?B?OVRkVHdob1hlbEFBdnNQNWh0OUcvTi9Pb0VkT1NPOUZwbHRDSi8xS2VTSmNt?=
 =?utf-8?B?ZkFNOFpKR2VQVXBrQUJRZEZ5clU0eEpvNlE3N2QwU3hIemFkNWR5VGRkQm9P?=
 =?utf-8?B?R2xUZzRya1R0d1FpeUFMcFpNcUxoSWpDVS9lbXFMT2w5Qm5hVHlGUkZ0Z3RZ?=
 =?utf-8?B?TnR1MXVBVmJIdTBYdjhvVzNnazNzQzFnYUZVdkt1VTN6a2hZdmxiZm5sUDlD?=
 =?utf-8?B?dFVCRmxLQzBuRVd0NmhPVlNEeGNRbUwyNlpYMlhIMUZBUldsRzBzL3htRFVB?=
 =?utf-8?B?MURkUmpGM0pLWTIyUDU2U25JTWRHcHhERG1VZE1mY1N6UzJVZjdzTytqb2Z6?=
 =?utf-8?B?NG8rZFgvbSsvVWdYNFRVMzM3WGRwaWdBL296VFduQmR3Uk9ncEl1YUg0eGdU?=
 =?utf-8?B?VDQyK1ZickdkMGZjbDEvc0RrbVNIRWwvUDBBQVJhaDNuQXBIU3ozUzNlOTEy?=
 =?utf-8?B?SnAydWZPcE11NktHUHBGRnpQRzB1cE9xbHZQQlF3OFNVME9CNVRqU0g4NGFD?=
 =?utf-8?B?MW1KSFhiT1RuYks2TENaYmNKTDVZcnRxYnpEeC9jSUpYUEFZVkdvbnN5VGx4?=
 =?utf-8?B?Wm1MZFliUFpVSkxBT0dBaEJYOEJRU2pSemkxTi85MnlSYW51a2dvdUFJZHJm?=
 =?utf-8?B?NUtWY1dFcndBRTBldU5qS3ZOemRpQ1lNaU9jb3pWN2kxeDdFRFp6VEdka3Va?=
 =?utf-8?B?cTNUbFlJKzhTY2s0QWtXU0NDZTRNdWo1VEFqdjE1VnRLTW1Dd1orY2V6RjVo?=
 =?utf-8?B?ZWVjeGtoVGFzR0NqMHVrUmlWcjYrY2d2L2R3SXN0ZVl6RWNrZHowVFpZd2dW?=
 =?utf-8?B?NUg5OFF5OGczbUVueS92OUNKMHJ5TGJ4OHlGeHlhNjBrR3NCQ3VIVzRpZDFF?=
 =?utf-8?B?dTZyNzhLNkhUc041akN2bVBCOEZOazFqaE1VZEJ5dVhFUGRKc25HbGdkV29a?=
 =?utf-8?B?MU9rWmNhU3ZDMHYvZ3JNa1VQaHlGbGh2UkgxWFcwa1lTQUVIRUdIWWd4M0pw?=
 =?utf-8?B?Q3NtZStSVURzODdhZXhZelNXN1pKcERwQWNmUlFzZHBOS3NjM3FOT3owNCt5?=
 =?utf-8?B?enVNc1o4YlNMUkVabE0vbHVEQUcwUjJpenlBVCs3eGUvOFNKbThtbWdEcjYr?=
 =?utf-8?B?YmVwS1RqNzFqYnVnK1NkaWZwZzl5OUZ0V3hMd1pCQXBmTEFrKzdtUk14cWZZ?=
 =?utf-8?Q?TRoFvEQTwy3bFuIQ/tHuFXI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWEyWGRDa3ZZbmN0QkU0ZEdHVFJzWEs2ZXFJSllTaXk3WFFvdnltVE1yY3U3?=
 =?utf-8?B?YkI0VHNoVkdWaURKTXZvVThQVjY4L0t4TjhvRjV4VFl2SGZMOTJqcENzVXlr?=
 =?utf-8?B?UTJVKzhsODYwYmpIN0t0TkZNeWtsT3IxeWxZeFZYcDNOZWVZSSsycnFueUZm?=
 =?utf-8?B?MWRkNnBUWkJGZHFjQW1aRWcwL0cxNmZtQ3NIY3Z5eFc5SC9OOHUyOVJKMTd3?=
 =?utf-8?B?NjRqT0dRM0F2enBqVERETEtYdGlZdFQ2NnlRa2MzUitlZzQyZVBudmY1Y2ZC?=
 =?utf-8?B?NzYrYlE5L2EvOUp3K084ckpRS3o0TUFsMlZsVVhMS1hTVnMwbDdjRjkvdHc2?=
 =?utf-8?B?d08xRSs4M2JMdFFhVTJtd0M2UUNYd1REN1AyUm9iTkJDdUhEcEZoc3krL1NO?=
 =?utf-8?B?STFHQWZOVGkwK2V1QTY1Y0ppWGlhMkxOaC85QzhSdXV4WE0yMTJkcFVVUWND?=
 =?utf-8?B?aVpuTGUrZE9KNGJ0aFhzZGhKQ2JwT0ptS3JZaU1sY3IyM3hoWExGUEdMOUFR?=
 =?utf-8?B?ekxzQ2FVQThzRFhqV2U1ZmdFVHByYTU4V3E2VWtDQ0RhZmx5MDZqck50Wlpp?=
 =?utf-8?B?VzFORXNrNmRUREZoSG5PdlhTK1pxZmdGVm5idGRabnNxaHdMbkNJSzZyZHF2?=
 =?utf-8?B?MUNtZEtYNTBVU2ZXbStBSzFGTCtKeG9hUlJLS1ZzYnVnL3lDQkVPSUhXVGUx?=
 =?utf-8?B?M0ZNSitkUFJ1Nmt4NFd1aGUxNmlMcU9Vc3pqaWI1QmswZ2NzMldoQUdYQUpy?=
 =?utf-8?B?Q1N0VW9kOFRnSExBR0RCalV3aVFoSVBaS3RsTitDMHc3Vi9KUUlrZDFxaG5n?=
 =?utf-8?B?aHNMbkxCQkl6VmFBVlVoQ2xodXoyNXhlRlhXQlRRczNLV3JLUEoyOGxnMXRS?=
 =?utf-8?B?aytVVXMvZnVERm5DOXpEZUlFbEoyR2prZ0RFZUlyMEt2djVCM1QrNGlXbndM?=
 =?utf-8?B?dUlrYTdIcVRvb0Y1Yk5KMGZTL3NIUGlmMWRzNHUvQVJjSTJZd3BrNjFMSVhl?=
 =?utf-8?B?M01nOC9sMXFYOGhTdnF5bWRoV25MNWJ5V2tna2V5aWZmOXlNcitVQjNJdEdC?=
 =?utf-8?B?UEkvR05HNnlNM3Fya2ZnRXBOUzkyRjVCclZuckdWNUM5SVRZaGZSSlN1OXo0?=
 =?utf-8?B?aVlmdDBzQ2UvVzB3NkgxR05oOFQwbEEyTlJHYVFZT0Zsa0ErUEFERjVWUHEv?=
 =?utf-8?B?R2tvZGRmNWVzYkRwWUFrRTQybWk3RzNObkpWMEFnUjN0R0t3dGlnTE10cGJ6?=
 =?utf-8?B?VlZsRUdWME5MV1B5dEFsWGFxMnRnVHcxOENoQ0dDNTUwb2lCSzgralc0ZW1X?=
 =?utf-8?B?clV5SjBBZGJHaWdvVFQ0aWlEZEwzc2FYYWNRRjd1c0gwWVhtQ3VEMXpyY2lM?=
 =?utf-8?B?OFVPVUxSZzd5NUJ6dDB0OG9KQWl3Q2dNYkNmRTJQTEoyYkRVOE1BaGhRMjVR?=
 =?utf-8?B?VkZWWjMxYzkxb1JMdlpHTk8rQi9odFhaZldOTzhtZUI4VnNRRGs1ZS9TVTBE?=
 =?utf-8?B?UkowaUNKdXpvUTNIZHkyWEtsVVFYT0lXRWpmNnRXci9qWU1ySWJhRFZPZW5R?=
 =?utf-8?B?dXNZWVZaaUZ4Q1pNQlVqQkRZQllqQVl4LzFldjVMdGhXNW5kSElCMUwxWVMy?=
 =?utf-8?B?QUE5N3hhYWZoNVVmOUM2MlZ3eVhGTlA1d2I1bVkyS3duM25TQXZocVJKQ1ov?=
 =?utf-8?B?RzZIOXk2c09rVlV2K21MaFFiVDlGMjBWa3BaaTVHc1NHRGJZUGt4Q3IxOEZ6?=
 =?utf-8?B?R2QyYzRmQWs4TXM1VTluUXBucTRna3pYZ3dldFB0ZHVoaVNRN2tjMEFoZndB?=
 =?utf-8?B?OFAzVFI1UFdvaE5WNlZrSGIyMjExd2g1blc1b3JBa2lkRTN0d1YxTkwrQmdn?=
 =?utf-8?B?M282NSsvVTlvTnhtVWp6cThXMFhxMTNaYXo0T1BCUHpYcXZMUGZHb05POE5s?=
 =?utf-8?B?NmdnQVh5cThmY0FvZWxQT1hubTUydjJJalh6Nm1KWVJnamdtZWRLZTFuRkt3?=
 =?utf-8?B?R3ZCTTBSRzd1WnpVbmFTbnJmYlQ5ekN2ejFhcUxMKzE0M3hub0xxVWNva2JQ?=
 =?utf-8?B?WFpEQzlnOW5PWjRVSFBOeFladld4em5oa054Rm5CNEx3UERObVc3cE1ycWJh?=
 =?utf-8?B?SEt1bmx0blhWckUyd25JWnQ1WkIvSnllVXFWNWNzdGI2U1NURk5pdXhPY1NZ?=
 =?utf-8?B?dWoyR2VjN0JJQWtQMmxjcTk1WGFlMTlVMWpSNU1jcFJpbEwxWk91aGJQdEVK?=
 =?utf-8?B?bmNJQmVVcnZHdkxzL3ZPZWl5c1V3a3ZSUzI5VERBUC9LNmwxVjZ2Z1pRS0lo?=
 =?utf-8?B?cG9rWExuQWg0TjlxUjd5UVZLYlBnSlJKZGFRSHRFbElBZy9idGJiUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4caf27a1-69c1-488c-20d4-08de73adaed8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 14:04:53.3030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mnKBTiIywL4qwVdxmZ8miqtSHPYaeTEHopW7kVVPSIyf0X97IP/vrY/aIMckgFuyHQEnbi/ff606/Tiz29etmjuwJpKb07VPs1jsS1ryoWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8437
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

KyBDYXJsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0
dGhldyA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogMjQgRmVicnVhcnkgMjAyNiAx
OToyNg0KPiBUbzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+OyBp
bnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiB0aG9tYXMuaGVsbHN0cm9t
QGxpbnV4LmludGVsLmNvbTsgTXJvemVrLCBNaWNoYWwNCj4gPG1pY2hhbC5tcm96ZWtAaW50ZWwu
Y29tPjsgU291emEsIEpvc2UgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIFY0IDMvNF0gZHJtL3hlL3hlM3BfbHBnOiBFbmFibGUgTDIgZmx1c2ggb3B0aW1pemF0
aW9uDQo+IGZlYXR1cmUNCj4gDQo+IE9uIDI0LzAyLzIwMjYgMTM6NTQsIFVwYWRoeWF5LCBUZWph
cyB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
IEZyb206IEF1bGQsIE1hdHRoZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+ID4+IFNlbnQ6
IDI0IEZlYnJ1YXJ5IDIwMjYgMTk6MTkNCj4gPj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMu
dXBhZGh5YXlAaW50ZWwuY29tPjsgaW50ZWwtDQo+ID4+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiA+PiBDYzogdGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20NCj4gPj4gU3ViamVj
dDogUmU6IFtQQVRDSCBWNCAzLzRdIGRybS94ZS94ZTNwX2xwZzogRW5hYmxlIEwyIGZsdXNoDQo+
ID4+IG9wdGltaXphdGlvbiBmZWF0dXJlDQo+ID4+DQo+ID4+IE9uIDI0LzAyLzIwMjYgMTE6MzEs
IFRlamFzIFVwYWRoeWF5IHdyb3RlOg0KPiA+Pj4gV2hlbiBzZXQsIHRoZSBMMiBmbHVzaCBvcHRp
bWl6YXRpb24gZmVhdHVyZSB3aWxsIGNvbnRyb2wgd2hldGhlciBMMg0KPiA+Pj4gaXMgaW4gUGVy
c2lzdGVudCBvciBUcmFuc2llbnQgbW9kZSB0aHJvdWdoIG1vbml0b3Jpbmcgb2YgbWVkaWEgYWN0
aXZpdHkuDQo+ID4+Pg0KPiA+Pj4gVG8gZW5hYmxlIEwyIGZsdXNoIG9wdGltaXphdGlvbiBpbmNs
dWRlIG5ldyBmZWF0dXJlIGZsYWcNCj4gPj4+IEdVQ19DVExfRU5BQkxFX0wyRkxVU0hfT1BUIGZv
ciBOb3ZhbGFrZSBwbGF0Zm9ybXMgd2hlbiBtZWRpYQ0KPiB0eXBlIGlzDQo+ID4+PiBkZXRlY3Rl
ZC4NCj4gPj4+DQo+ID4+PiBBbHNvLCByZXN0cmljdCB1c2VycHRyLCBzdm0gYW5kIGRtYWJ1ZiBt
YXBwaW5ncyB0byBiZSBlaXRoZXIgMldBWSBvcg0KPiA+Pj4gWEErMVdBWQ0KPiA+Pg0KPiA+PiBT
aG91bGQgd2UgYWxzbyB1cGRhdGUgdGhlIHVhcGkgaGVhZGVyIGtlcm5lbC1kb2MgdG8gZG9jdW1l
bnQvcmVmbGVjdA0KPiA+PiB0aGlzLCBzaW5jZSB0aGlzIGlzIGEgbmV3IHVhcGkgY29udHJhY3Q/
IEFsc28gd2l0aCB0aGF0IHdlIG5lZWQgdGhlDQo+ID4+IHVzdWFsIFVNRCBDYywganVzdCB0byBt
YWtlIHN1cmUgd2UgYXJlIG9uIHRoZSBzYW1lIHBhZ2UuDQo+ID4NCj4gPiBTdXJlIGFkZGluZyBN
aWNoYWwgYW5kIEpvc2UuDQo+IA0KPiBBbHNvIG1lZGlhIHNpZGU/DQo+IA0KPiA+DQo+ID4+DQo+
ID4+IEFsc28gaXQgbWlnaHQgbWFrZSBzZW5zZSB0byBzcGxpdCB0aGUgdWFwaSBzdHVmZiBvdXQg
YW5kIGV4bGljaXR5DQo+ID4+IGxhYmVsDQo+ID4+IHdpdGg6ICJkcm0veGUvdWFwaToiLCBvciBy
ZWxhYmVsIHRoaXMgY29tbWl0IHdpdGggInVhcGkiIHNvbWV3aGVyZSBpbg0KPiA+PiB0aGUgY29t
bWl0IHRpdGxlPw0KPiA+DQo+ID4gSW4gYSB3YXkgcmlnaHQsIHdlIGFyZSBjaGFuZ2luZyB0aGUg
ZXhwZWN0YXRpb24gZm9yIFVBUEkgc28gY2FuIGJlIHNwbGl0IGFuZA0KPiBsYWJlbGxlZC4gSSB3
aWxsIHNlZSB3aGF0IGlzIGJlc3QgZml0LCBzcGxpdCBvciByZW5hbWUgdG8gY29tbWl0Lg0KPiA+
DQo+ID4gVGVqYXMNCj4gPj4NCj4gPj4+DQo+ID4+PiBWMyhNYXR0QSk6IGNoZWNrIHZhbGlkIG9w
IGFuZCBwYXRfaW5kZXggdmFsdWUNCj4gPj4+IFYyKE1hdHRBKTogdmFsaWRhdGUgZG1hLWJ1ZiBi
b3MgYW5kIG1hZHZpc2UgcGF0LWluZGV4DQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogVGVq
YXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gPj4gICA+IC0tLT4gICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMgICAgICAgIHwgIDMgKysrDQo+ID4+PiAgICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Z3aWYuaCAgIHwgIDEgKw0KPiA+Pj4gICAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3ZtLmMgICAgICAgICB8ICA4ICsrKysrKysrDQo+ID4+PiAgICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfdm1fbWFkdmlzZS5jIHwgMjMNCj4gKysrKysrKysrKysrKysrKysrKysr
KysNCj4gPj4+ICAgIDQgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4NCj4g
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMNCj4gPj4+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jIGluZGV4IGNiYmI0ZDY2NWI4Zi4uOTdjMzNjM2RkNTIw
DQo+ID4+PiAxMDA2NDQNCj4gPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0K
PiA+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jDQo+ID4+PiBAQCAtOTgsNiAr
OTgsOSBAQCBzdGF0aWMgdTMyIGd1Y19jdGxfZmVhdHVyZV9mbGFncyhzdHJ1Y3QgeGVfZ3VjICpn
dWMpDQo+ID4+PiAgICAJaWYgKHhlX2d1Y191c2luZ19tYWluX2dhbWN0cmxfcXVldWVzKGd1Yykp
DQo+ID4+PiAgICAJCWZsYWdzIHw9IEdVQ19DVExfTUFJTl9HQU1DVFJMX1FVRVVFUzsNCj4gPj4+
DQo+ID4+PiArCWlmIChHUkFQSElDU19WRVIoeGUpID49IDM1ICYmICFJU19ER0ZYKHhlKSAmJg0K
PiA+PiB4ZV9ndF9pc19tZWRpYV90eXBlKGd1Y190b19ndChndWMpKSkNCj4gPj4+ICsJCWZsYWdz
IHw9IEdVQ19DVExfRU5BQkxFX0wyRkxVU0hfT1BUOw0KPiA+PiAgID4gKz4gICAJcmV0dXJuIGZs
YWdzOw0KPiA+Pj4gICAgfQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjX2Z3aWYuaA0KPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Z3
aWYuaA0KPiA+Pj4gaW5kZXggYTMzZWEyODhiOTA3Li4zOWZmN2IzZTk2MGIgMTAwNjQ0DQo+ID4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Z3aWYuaA0KPiA+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d1Y19md2lmLmgNCj4gPj4+IEBAIC02Nyw2ICs2Nyw3IEBAIHN0
cnVjdCBndWNfdXBkYXRlX2V4ZWNfcXVldWVfcG9saWN5IHsNCj4gPj4+ICAgICNkZWZpbmUgICBH
VUNfQ1RMX0VOQUJMRV9QU01JX0xPR0dJTkcJQklUKDcpDQo+ID4+PiAgICAjZGVmaW5lICAgR1VD
X0NUTF9NQUlOX0dBTUNUUkxfUVVFVUVTCUJJVCg5KQ0KPiA+Pj4gICAgI2RlZmluZSAgIEdVQ19D
VExfRElTQUJMRV9TQ0hFRFVMRVIJQklUKDE0KQ0KPiA+Pj4gKyNkZWZpbmUgICBHVUNfQ1RMX0VO
QUJMRV9MMkZMVVNIX09QVAlCSVQoMTUpDQo+ID4+Pg0KPiA+Pj4gICAgI2RlZmluZSBHVUNfQ1RM
X0RFQlVHCQkJMw0KPiA+Pj4gICAgI2RlZmluZSAgIEdVQ19MT0dfVkVSQk9TSVRZCQlSRUdfR0VO
TUFTSygxLCAwKQ0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5j
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPj4+IGluZGV4IGMwNmZkMjUwZTAzNy4u
ODA5Yzg2OGI4ZWExIDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
LmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4+PiBAQCAtMzQ3
NCw2ICszNDc0LDEwIEBAIHN0YXRpYyBpbnQgdm1fYmluZF9pb2N0bF9jaGVja19hcmdzKHN0cnVj
dA0KPiA+PiB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgeGVfdm0gKnZtLA0KPiA+Pj4gICAgCQkJCSBv
cCA9PQ0KPiA+PiBEUk1fWEVfVk1fQklORF9PUF9NQVBfVVNFUlBUUikgfHwNCj4gPj4+ICAgIAkJ
ICAgIFhFX0lPQ1RMX0RCRyh4ZSwgY29oX21vZGUgPT0gWEVfQ09IX05PTkUgJiYNCj4gPj4+ICAg
IAkJCQkgb3AgPT0NCj4gPj4gRFJNX1hFX1ZNX0JJTkRfT1BfTUFQX1VTRVJQVFIpIHx8DQo+ID4+
PiArCQkgICAgWEVfSU9DVExfREJHKHhlLCB4ZV9kZXZpY2VfaXNfbDJfZmx1c2hfb3B0aW1pemVk
KHhlKSAmJg0KPiA+Pj4gKwkJCQkgKG9wID09DQo+ID4+IERSTV9YRV9WTV9CSU5EX09QX01BUF9V
U0VSUFRSIHx8DQo+ID4+PiArCQkJCSAgaXNfY3B1X2FkZHJfbWlycm9yKSAmJg0KPiA+Pj4gKwkJ
CQkgKHBhdF9pbmRleCAhPSAxOSB8fCBjb2hfbW9kZSAhPQ0KPiA+PiBYRV9DT0hfMldBWSkpIHx8
DQo+ID4+PiAgICAJCSAgICBYRV9JT0NUTF9EQkcoeGUsIGNvbXBfZW4gJiYNCj4gPj4+ICAgIAkJ
CQkgb3AgPT0NCj4gPj4gRFJNX1hFX1ZNX0JJTkRfT1BfTUFQX1VTRVJQVFIpIHx8DQo+ID4+PiAg
ICAJCSAgICBYRV9JT0NUTF9EQkcoeGUsIG9wID09DQo+ID4+IERSTV9YRV9WTV9CSU5EX09QX01B
UF9VU0VSUFRSICYmIEBADQo+ID4+PiAtMzYwOCw2ICszNjEyLDEwIEBAIHN0YXRpYyBpbnQgeGVf
dm1fYmluZF9pb2N0bF92YWxpZGF0ZV9ibyhzdHJ1Y3QNCj4gPj4geGVfZGV2aWNlICp4ZSwgc3Ry
dWN0IHhlX2JvICpibywNCj4gPj4+ICAgIAlpZiAoWEVfSU9DVExfREJHKHhlLCBiby0+dHRtLmJh
c2UuaW1wb3J0X2F0dGFjaCAmJiBjb21wX2VuKSkNCj4gPj4+ICAgIAkJcmV0dXJuIC1FSU5WQUw7
DQo+ID4+Pg0KPiA+Pj4gKwlpZiAoWEVfSU9DVExfREJHKHhlLCBiby0+dHRtLmJhc2UuaW1wb3J0
X2F0dGFjaCAmJg0KPiA+PiB4ZV9kZXZpY2VfaXNfbDJfZmx1c2hfb3B0aW1pemVkKHhlKSAmJg0K
PiA+Pj4gKwkJCSAocGF0X2luZGV4ICE9IDE5IHx8IGNvaF9tb2RlICE9IFhFX0NPSF8yV0FZKSkp
DQo+ID4+PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPj4+ICsNCj4gPj4+ICAgIAkvKiBJZiBhIEJP
IGlzIHByb3RlY3RlZCBpdCBjYW4gb25seSBiZSBtYXBwZWQgaWYgdGhlIGtleSBpcyBzdGlsbCB2
YWxpZCAqLw0KPiA+Pj4gICAgCWlmICgoYmluZF9mbGFncyAmIERSTV9YRV9WTV9CSU5EX0ZMQUdf
Q0hFQ0tfUFhQKSAmJg0KPiA+PiB4ZV9ib19pc19wcm90ZWN0ZWQoYm8pICYmDQo+ID4+PiAgICAJ
ICAgIG9wICE9IERSTV9YRV9WTV9CSU5EX09QX1VOTUFQICYmIG9wICE9DQo+ID4+PiBEUk1fWEVf
Vk1fQklORF9PUF9VTk1BUF9BTEwpIGRpZmYgLS1naXQNCj4gPj4+IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3ZtX21hZHZpc2UuYw0KPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fbWFk
dmlzZS5jDQo+ID4+PiBpbmRleCAxYTFhZDhjMDdkNDkuLmU2NjllNTc4NjE4YiAxMDA2NDQNCj4g
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV9tYWR2aXNlLmMNCj4gPj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV9tYWR2aXNlLmMNCj4gPj4+IEBAIC00MTEsNiArNDEx
LDcgQEAgaW50IHhlX3ZtX21hZHZpc2VfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4g
Pj4gdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWwNCj4gPj4+ICAgIAlzdHJ1Y3QgeGVf
dm1hc19pbl9tYWR2aXNlX3JhbmdlIG1hZHZpc2VfcmFuZ2UgPSB7LmFkZHIgPSBhcmdzLQ0KPiA+
Pj4gc3RhcnQsDQo+ID4+PiAgICAJCQkJCQkJIC5yYW5nZSA9ICBhcmdzLT5yYW5nZSwNCj4gPj4g
fTsNCj4gPj4+ICAgIAlzdHJ1Y3QgeGVfbWFkdmlzZV9kZXRhaWxzIGRldGFpbHM7DQo+ID4+PiAr
CXUxNiBwYXRfaW5kZXgsIGNvaF9tb2RlOw0KPiA+Pj4gICAgCXN0cnVjdCB4ZV92bSAqdm07DQo+
ID4+PiAgICAJc3RydWN0IGRybV9leGVjIGV4ZWM7DQo+ID4+PiAgICAJaW50IGVyciwgYXR0cl90
eXBlOw0KPiA+Pj4gQEAgLTQ0Nyw2ICs0NDgsMTcgQEAgaW50IHhlX3ZtX21hZHZpc2VfaW9jdGwo
c3RydWN0IGRybV9kZXZpY2UNCj4gKmRldiwNCj4gPj4gdm9pZCAqZGF0YSwgc3RydWN0IGRybV9m
aWxlICpmaWwNCj4gPj4+ICAgIAlpZiAoZXJyIHx8ICFtYWR2aXNlX3JhbmdlLm51bV92bWFzKQ0K
PiA+Pj4gICAgCQlnb3RvIG1hZHZfZmluaTsNCj4gPj4+DQo+ID4+PiArCWlmIChhcmdzLT50eXBl
ID09IERSTV9YRV9NRU1fUkFOR0VfQVRUUl9QQVQpIHsNCj4gPj4+ICsJCXBhdF9pbmRleCA9IGFy
cmF5X2luZGV4X25vc3BlYyhhcmdzLT5wYXRfaW5kZXgudmFsLCB4ZS0NCj4gPj4+IHBhdC5uX2Vu
dHJpZXMpOw0KPiA+Pj4gKwkJY29oX21vZGUgPSB4ZV9wYXRfaW5kZXhfZ2V0X2NvaF9tb2RlKHhl
LCBwYXRfaW5kZXgpOw0KPiA+Pj4gKwkJaWYgKFhFX0lPQ1RMX0RCRyh4ZSwgbWFkdmlzZV9yYW5n
ZS5oYXNfc3ZtX3VzZXJwdHJfdm1hcw0KPiA+PiAmJg0KPiA+Pj4gKwkJCQkgeGVfZGV2aWNlX2lz
X2wyX2ZsdXNoX29wdGltaXplZCh4ZSkgJiYNCj4gPj4+ICsJCQkJIChwYXRfaW5kZXggIT0gMTkg
fHwgY29oX21vZGUgIT0NCj4gPj4gWEVfQ09IXzJXQVkpKSkgew0KPiA+Pj4gKwkJCWVyciA9IC1F
SU5WQUw7DQo+ID4+PiArCQkJZ290byBtYWR2X2Zpbmk7DQo+ID4+PiArCQl9DQo+ID4+PiArCX0N
Cj4gPj4+ICsNCj4gPj4+ICAgIAlpZiAobWFkdmlzZV9yYW5nZS5oYXNfYm9fdm1hcykgew0KPiA+
Pj4gICAgCQlpZiAoYXJncy0+dHlwZSA9PSBEUk1fWEVfTUVNX1JBTkdFX0FUVFJfQVRPTUlDKSB7
DQo+ID4+PiAgICAJCQlpZiAoIWNoZWNrX2JvX2FyZ3NfYXJlX3NhbmUodm0sDQo+ID4+IG1hZHZp
c2VfcmFuZ2Uudm1hcywgQEAgLTQ2NCw2DQo+ID4+PiArNDc2LDE3IEBAIGludCB4ZV92bV9tYWR2
aXNlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQNCj4gPj4+ICsqZGF0YSwNCj4g
Pj4+IHN0cnVjdCBkcm1fZmlsZSAqZmlsDQo+ID4+Pg0KPiA+Pj4gICAgCQkJCWlmICghYm8pDQo+
ID4+PiAgICAJCQkJCWNvbnRpbnVlOw0KPiA+Pj4gKw0KPiA+Pj4gKwkJCQlpZiAoYXJncy0+dHlw
ZSA9PQ0KPiA+PiBEUk1fWEVfTUVNX1JBTkdFX0FUVFJfUEFUKSB7DQo+ID4+PiArCQkJCQlpZiAo
WEVfSU9DVExfREJHKHhlLCBiby0NCj4gPj4+IHR0bS5iYXNlLmltcG9ydF9hdHRhY2ggJiYNCj4g
Pj4+ICsNCj4gPj4geGVfZGV2aWNlX2lzX2wyX2ZsdXNoX29wdGltaXplZCh4ZSkgJiYNCj4gPj4+
ICsJCQkJCQkJIChwYXRfaW5kZXggIT0gMTkgfHwNCj4gPj4+ICsJCQkJCQkJICBjb2hfbW9kZSAh
PQ0KPiA+PiBYRV9DT0hfMldBWSkpKSB7DQo+ID4+PiArCQkJCQkJZXJyID0gLUVJTlZBTDsNCj4g
Pj4+ICsJCQkJCQlnb3RvIGVycl9maW5pOw0KPiA+Pj4gKwkJCQkJfQ0KPiA+Pj4gKwkJCQl9DQo+
ID4+PiArDQo+ID4+PiAgICAJCQkJZXJyID0gZHJtX2V4ZWNfbG9ja19vYmooJmV4ZWMsICZiby0N
Cj4gdHRtLmJhc2UpOw0KPiA+Pj4gICAgCQkJCWRybV9leGVjX3JldHJ5X29uX2NvbnRlbnRpb24o
JmV4ZWMpOw0KPiA+Pj4gICAgCQkJCWlmIChlcnIpDQo+ID4NCg0K

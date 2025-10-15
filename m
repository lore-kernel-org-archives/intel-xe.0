Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5BCCCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 20:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E169F10E8DB;
	Wed, 15 Oct 2025 20:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QArm3waP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD5710E8DB
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 20:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760559265; x=1792095265;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=U0ZrjIuN8WyDBWfSlVyWQhBs0AZUjP3v6llDtpSwDcA=;
 b=QArm3waPlyNe2d0aaXPdFdKKwQ9Dqfs3otVSSiuycLSlCJlq83YTg+lp
 DBwuyupUGmUo8iR4VXrhaJQaavIFyKjDiYXM84jHq/DnDAEM3jGIqWnkR
 MXQPmd9NxCFN265UQ06B42JfTliHdxsZuj6LardYydq+K/Ow69bCf4KIi
 3M6crJWJqxJUqZ6bb2tnZH9szoJ3oPX5JpJYX39p3k7Ggyb0jhOGvebWV
 ZMwSAUS4D6wrTOZlMrkhNELSWlkpqPzHiV7pFVDNCyJzMk3IZH+OSdz/M
 C4RtZFyyLbjieeKbMGwHB1HBf7h++NQzVrhV6m4QZrXCAl+kaknywswcL w==;
X-CSE-ConnectionGUID: DaCXJ7yQR2W6m8HalTraLg==
X-CSE-MsgGUID: G7Hh/6SWThy5CYOAYPdTYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73856936"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="73856936"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 13:14:24 -0700
X-CSE-ConnectionGUID: lXqvTq3gQAaZTB7gUmCu8w==
X-CSE-MsgGUID: ZOzf1Z2bTe2XaLeK/h8XuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="212876047"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 13:14:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 13:14:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 13:14:23 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 13:14:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b08lafPfctBNsBbaZ/TQpd59v0YJqn2Qg3W/UN8Z+5OHjx4yqPcR9Mj3SAxrAg0mJLbYE3i+SW536d0YXgWpTYmRLZAyV2zMtnXY4bru9FLAgFAZpy5KPdv11+DzzWp/rhagKSVe2NzdcpC9fv5eXsmMuLdMlJgN1KLwtIuxORoPjKG69Ino6P+hBAPD3ruqriCK7zwogZqO2gAIITwOQGaBXT61qesUsPXVyJ/+evakQZtE2t3eVqtWBWB13XKtt0kto9FI53oQndasCR0IPCxi9px/bVCNKgfu/6OtAzMHqXh0qIGUtCnfb/ESmiPKljqijMOSJucxDh1HCKuefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1+J4mbWn7tSiRQi5ADayqLJCVx13K3hTuJQ1OOoZr4=;
 b=B+eI30yOtKNwzTVrNql/z4HMsOJWiD+LmYFCmdl+yXt0bzdXY0p5AvJ5MEFn/t6Q1OB7I18BBXkQaZZs07J9F1Ukbkqp10KtKSrUj2H0vtRhmmKacM4/RTDYI0gZERDOyCyxRYTcbSVAN1pNQ55SZ6ld2YB7R0tA6v+EVC3uGs7VItGig8ywHb9Bgq7/VVGlCCU8SjiiKgxEBmbGn2I1ETUJ13h8kiGx3CBxnRFYhu4F1lzr/+lhEIcB+uiUjsLgPBWLukQglzvBHwdBMUPTc/lSW7HmAqdzHggS5ArvKwfU4/juIei055juOW5/+WabcQCIq7/GjItHVejJJn1JkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA3PR11MB9464.namprd11.prod.outlook.com (2603:10b6:806:464::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 20:14:21 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 20:14:21 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251013-xe3p-v1-9-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-9-bfb74f038215@intel.com>
Subject: Re: [PATCH 09/23] drm/xe/xe3p: Determine service copy availability
 from fuse
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Wed, 15 Oct 2025 17:14:16 -0300
Message-ID: <176055925646.3168.17721467155157998163@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA3PR11MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: 4303fc55-68b6-4cd7-8884-08de0c276cfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SW1lWVdocmlDSC9hRDhxcGdTb2R1T21tNUJHeTlaWmErSXYveW9zWU4wZThq?=
 =?utf-8?B?SU8wSFZETnM4bGVxTHU3Njc5NGtmUm9yYldCeTl4cjFHREcyelY3bmhQRGJy?=
 =?utf-8?B?bW12d0FpZCtlbGtnSUl0aTQrUUN1OUV2enRIV1VSQUJrcHhsdXVFWlpqZUY1?=
 =?utf-8?B?SS9MTkpURzNpNTFZY0ZzRFdTcjNlOWZJSlJDUFcxTmRiYkk3Tk5QUVdkaVFV?=
 =?utf-8?B?SG0xZnJhME1tZGd6VVc1azgwZWhlRDU3SFFqUGZGM0szUWdMTVdBcTZPRE5M?=
 =?utf-8?B?eHYwVFRYNzd1dzZnUDA0K1BEdWpxMjRQb2VmZzlwMFA4MnRLWmFnU0xNbDZQ?=
 =?utf-8?B?V1B6c3pxVFhDQzkzODlWWDBMMFl1a2FoUTdrTlo4Ym50OExaRzlXQXN4ZTFp?=
 =?utf-8?B?WGJqQUZ5YlVNSXZyb2VzZDlHbzJ1WWFFeWYrb1RTOG1TOTRvT1VvTWVkYjYw?=
 =?utf-8?B?OEdKczBJdjFoQm1NM2s0ODdtTklybnpjczNMcHFxUHRLT2locGhqUVRITVls?=
 =?utf-8?B?eGQrTWdaRjFZSjBuVFlsUHpWYTFFTHlMckxLdFFqK0l5UXVEaXE1WWVmOVIx?=
 =?utf-8?B?cUFtRDNZano1NjcvUUhUZk9PY25LbXhoQSt1eW1zcHFIS2V5YkYxOWtoVWVq?=
 =?utf-8?B?LytDakdNKy9sbitXSDVGaXVjRGVzN3lkSXpPU0tPOFozRFlyUnN5Ryt3R1ZO?=
 =?utf-8?B?STRibm1GS2YwVDRLZVV0TVg5Sk5GV2ZuQTBDOEl2N0trMnZhV3lLcXYvUFha?=
 =?utf-8?B?MVRBNUk5NEtIbDIvMVRBck5MODRhNFd5SXhWR2xmQ1ozYUc0SnE5U2Fzclk2?=
 =?utf-8?B?b1NQRFBxUkhGK1poSm9mWm9ZL3h5NTlDS0doTGtHUzlzZUZtWG9hdlhrVjN5?=
 =?utf-8?B?NVpqQW9CakJxNTJEMGJZUzdNRm1iQlVFRS85Q1NhNDllSU1zVVZtZ3oxTkw1?=
 =?utf-8?B?M0Q4SEJQaXRJSU1OcXFXdXRKeGhYcE5lUlVRemRqaVRSTnJqby80WDFCWmEx?=
 =?utf-8?B?ZjZ6U3F2a0NQdUNJanJtY0dVYnl3dFBid0NJNndkbW9WL2R5UmRRbVdSaG1t?=
 =?utf-8?B?VGk1N2w2K0lIUENySUNMNmNWMm1wanNocSs0RGUwdWQvZUVuVWgwaEIzR25W?=
 =?utf-8?B?ZmZFcUNMRXJZT1JteEdHNFdTMUxPRnJSVzFBb1ZMaEZUTDVaY0Foa3ZvcGpB?=
 =?utf-8?B?UDJZM3pSUVhpdDZ3Z3JOcWFqR3N1MU1HYzI0c0dnek92NXRJUWgrRlBESDBN?=
 =?utf-8?B?Tk5RR3JWT3U0eVRDRDNKWDYyN29tWlNJblJQSHJMV3huR0pWSDJZUGJ2K29a?=
 =?utf-8?B?dDVGWXhtUzl0YWErUllOQWxvYWszVGp2a3Rnei8xZlV0VTkwcTkwODRJRDQ0?=
 =?utf-8?B?MnRodC9HajNram1nUGZ0R3U0MFpnQkdDZHRDY0h4VFdZMVY5STFoQW05bnJl?=
 =?utf-8?B?d3RubHF4b0taVkdBeDBGTEF1aDdHN21jQzBZcWljaTl1b2MyenlQVzJXcVpL?=
 =?utf-8?B?QmcyM1IrUkpqbXNWR3NzUmwwSnQ5cDVVWHdzaDVGaHNhOUx0cU8zWFlEcWxz?=
 =?utf-8?B?b09pMHk0dmtHVUpYNkRsREloZHpRaVBwazN0UTBYZWhtb2ljTjFwbklIVjM2?=
 =?utf-8?B?U3Q0MWpzV0dZSlVzRElBeGtCTTBpaUo5WkE4b2lLUnZwanhUYUlhZW9hWkpm?=
 =?utf-8?B?VjdvdCs5QXlFcWJMTWtzRS80eUowYUUvb0JTR1pHODYzNlJnZm9YM0M1cFdG?=
 =?utf-8?B?VmJTY1N2UjUzT3AxQ1dzb2dIZmY5NWhkWmFkQzBWdmNZcXdhZ1l2MEFaeWlD?=
 =?utf-8?B?KzQ3Uk9CKzhSY1pPOEg0Rm5RUmk2UFlodHd0LzFLQ1ptZTVVUGZqZE9zSkxM?=
 =?utf-8?B?VXg2b205dTVUL2NtQWxkS0ExRWhVbVVQakZQM1RNVk5iU2RiclN4NHF3MDFm?=
 =?utf-8?Q?ono38PkbxhYCPJJefGILy67XpvTFjzMD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzY1aTB4TGVuQnpqTzMyS3BJM1pNQys3YmovN2ZTeVpKaDZDY1d5bGRGME1O?=
 =?utf-8?B?eTg2S1JKeDZ5WHlYZVpkaHFvYlV6bXJnUEtHZ0JwdURkYVhpNkgyM21Od2lQ?=
 =?utf-8?B?aWhNNU9paHByRzdSQlFkL21ER0xtNU9NaE01VGxXSVN2QzNwU055T0hnNHRv?=
 =?utf-8?B?dGhTci83U2JMRGx1ZVR4aHNlSXNDSVhNZHlYNjh1R3NlSHowSGxyVUlIM1BO?=
 =?utf-8?B?c0l4VXhzc3hBd3BrTUJjZ04zOFdVODRrU25VQ0UyVWV0alhFQ210am9HQXIw?=
 =?utf-8?B?OG9pRzNaN0dwVkVISjNVUnZQbUhPeTZQTlVncmZTdmgwUjRqUDNLSWlEOHRw?=
 =?utf-8?B?TUVWeGpUWnUwS3VzOTZUUW1keGN5ZEJpbjlMSmU0aC94SHZmd3ZFN3pybUdW?=
 =?utf-8?B?Nll5SGdaVWFRb3A0VklwUlMxMlNDYUp4WVdJS3hIVkMycWM4WndtUVBjUSs0?=
 =?utf-8?B?V2FzVXYxajJEQ2ZtSEJ6c3VyampEQkYvSldWQmQ2US80NFYwQm4xSlBXUnJy?=
 =?utf-8?B?VG9KL21UbDdVUnJJNmIrd3J4ais3ZXcxSEd4OFRNd1VudDdhMVdXc2dBNjlZ?=
 =?utf-8?B?V2IwYVp6TlhubWdrbWU5NjA3R2VqM015R2VEYkxDQWZLWEg2SkJEN3VBYUMw?=
 =?utf-8?B?bFZDNGlYT2d1Qjc1NWUyZC9qeHVVV2xZeE04STRCV2c2emZ5U005TTVCQ3Br?=
 =?utf-8?B?Und6MmhoTm54bWh1dDZoSmhTMTM2b2VQa3Fad09tZndndzFNbk1hcmNYclEz?=
 =?utf-8?B?WWJoV2pUaVY3TXFSZ3lXSWpHeWVUV1c3UnVUSHAyQmpDQVhwbkVDbExBbFRs?=
 =?utf-8?B?WnQxRUN1UmgvZ1hlS3dWL2RRQndZVXNDSVBicGN3SXZ4QWI3eXMxSDkwanZB?=
 =?utf-8?B?ZDJUUVVzSlJjcjQwMFFWQlNYU3FwempDVnZrdFdpcWxYRVhkS0RoUUJqUVRZ?=
 =?utf-8?B?MDJIZ094MWxYTmRVUktudVpIU3M0YlJJc2twNDVrMDk3TDNOM25TcExpTjBh?=
 =?utf-8?B?WWU2UFA1Sm5CVGNmNnBZK3p1NGpRcVBjN3YvTHh2QUpkQXhzUGRuR3lXZTNP?=
 =?utf-8?B?Wi9CZWxmemN0TXMxMGhOcVlVc3JwQTIwTVRwbGNqbTgrNmtMVU01ZkdqWTY4?=
 =?utf-8?B?NGhMQ0NWb0JXSFBIcUtUOWwybTNMbXhaSmtVa3AvZjZVSUM1SU1lMDRuR0N5?=
 =?utf-8?B?M05FWlAySnFicWQzZDduczJiRlR2UWpRbVVPSWV2U2ZUdXNWczhUaWM2b3Vz?=
 =?utf-8?B?M0FZdHVCa252Q3haaWh4T1ZGQkhSeFp5b0RSYjNUeE91eUNMUS9Gcy8zWjZz?=
 =?utf-8?B?NHVPQi84NnR1VzF1emRmT0lVV3VmZFhsbjhZQlJMSFNiYUQwbDVHeHQ3eWdo?=
 =?utf-8?B?NzVxd3Z6YU1NVlNLQXluOHVKQUdQVEpXMXZFdmlJMkxpLy9walpkQkdGdzNK?=
 =?utf-8?B?M1JsU0lQZWUyWmkzclpNSFU5VUU4QXFNQk4vZW1JQnRmNWtNZk14eHZlbHhN?=
 =?utf-8?B?M0V1LzhpVUNZdTJBdXZINm9rMDYyOXJmUXVDNWVyTmt4L09lQmNBWWtLcyty?=
 =?utf-8?B?UEovbk9scktTMmhodVdCVmU5eldBVDV0dExhQ0pERmt6akF6TWZKMXBLbDZH?=
 =?utf-8?B?WWNzcnArZlJaNFdjajBHcGpUTERNOEhsQ2RITTQ4em5WaVN5b3lWeGl0ZWdT?=
 =?utf-8?B?SWNhYm9oTGUva0ZUVG1WM2htSVRPTExxSXp3anc0MzZEZ1I5aWVzT3NZV1VL?=
 =?utf-8?B?ZEZYa1hKVnliQmlvSURkWXNydlBseEV1WXR1QW9OMjJLSHN4WWN2SkJYT2pv?=
 =?utf-8?B?M2MrRkt4cHNPZm50QW91MVJyaG1KdHQzSHFwNk91ajlhMWtTcGFpcUJ0Y2lQ?=
 =?utf-8?B?dHBMRENGbS9CWFZ3dkRiTmhNbjduczlvSmxzdzlacVlDZlVkME9INmg1eGxD?=
 =?utf-8?B?T2dKSGZZMEFPaWQwMEVYQzc4NEJidTN5L05GbmtENUc1WE9NUVEyVXJUSXNz?=
 =?utf-8?B?NnZjVWo3RmdXTjR4TC9wOFhMZk1VK3Q0b2Ird0dZekorSXNaN2F6Uy9EbFNz?=
 =?utf-8?B?SzUzRVFyQkhnTGlHQ2VUT0E3ZFR1WWREdUwrbFMrZjArVHlTQ2FnUUpLb1JY?=
 =?utf-8?B?VUxrYUI1dW4wak81TEhCa25ld3NuVHhhWkVwU1Z0MXA0OFVwOUttRXFHRWhS?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4303fc55-68b6-4cd7-8884-08de0c276cfe
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 20:14:20.9062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhH4ACERpqJSrWLf/Uv5g3rb5vDZr+mSF9pedE9NiPFarz5hbGVDkdL04YZAlutWqHv+HJEFTm9vNCjw1m39/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9464
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

Quoting Lucas De Marchi (2025-10-14 00:24:41-03:00)
>From: Matt Roper <matthew.d.roper@intel.com>
>
>Xe3p introduces a dedicated SERVICE_COPY_ENABLE fuse register to reflect
>the availability of the service copy engines (BCS1-BCS8).
>
>Bspec: 74624
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
> drivers/gpu/drm/xe/xe_hw_engine.c    | 43 ++++++++++++++++++++++++++++---=
-----
> 2 files changed, 37 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/reg=
s/xe_gt_regs.h
>index 937dc341abe5e..b73efde21119f 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -245,6 +245,9 @@
> #define XE2_GT_GEOMETRY_DSS_1                        XE_REG(0x9150)
> #define XE2_GT_GEOMETRY_DSS_2                        XE_REG(0x9154)
>=20
>+#define SERVICE_COPY_ENABLE                        XE_REG(0x9170)
>+#define   FUSE_SERVICE_COPY_ENABLE_MASK                REG_GENMASK(7, 0)
>+
> #define GDRST                                        XE_REG(0x941c)
> #define   GRDOM_GUC                                REG_BIT(3)
> #define   GRDOM_FULL                                REG_BIT(0)
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_=
engine.c
>index 5544d91c21e8e..275d522d301a3 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -716,27 +716,52 @@ static void read_media_fuses(struct xe_gt *gt)
>         }
> }
>=20
>+static u32 infer_svccopy_from_meml3(struct xe_gt *gt)
>+{
>+        u32 meml3 =3D REG_FIELD_GET(MEML3_EN_MASK,
>+                                  xe_mmio_read32(&gt->mmio, MIRROR_FUSE3)=
);
>+        u32 svccopy_mask =3D 0;
>+
>+        /*
>+         * Each of the four meml3 bits determines the fusing of two servi=
ce
>+         * copy engines.
>+         */
>+        for (int i =3D 0; i < 4; i++)
>+                svccopy_mask |=3D (meml3 & BIT(i)) ? 0b11 << 2 * i : 0;
>+
>+        return svccopy_mask;
>+}
>+
>+static u32 read_svccopy_fuses(struct xe_gt *gt)
>+{
>+        return REG_FIELD_GET(FUSE_SERVICE_COPY_ENABLE_MASK,
>+                             xe_mmio_read32(&gt->mmio, SERVICE_COPY_ENABL=
E));
>+}
>+
> static void read_copy_fuses(struct xe_gt *gt)
> {
>         struct xe_device *xe =3D gt_to_xe(gt);
>         u32 bcs_mask;
>=20
>-        if (GRAPHICS_VERx100(xe) < 1260 || GRAPHICS_VERx100(xe) >=3D 1270=
)
>-                return;
>-
>         xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>=20
>-        bcs_mask =3D xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
>-        bcs_mask =3D REG_FIELD_GET(MEML3_EN_MASK, bcs_mask);
>+        if (GRAPHICS_VER(xe) >=3D 35)
>+                bcs_mask =3D read_svccopy_fuses(gt);
>+        else if (GRAPHICS_VERx100(xe) =3D=3D 1260)
>+                bcs_mask =3D infer_svccopy_from_meml3(gt);
>+        else
>+                return;
>=20
>-        /* BCS0 is always present; only BCS1-BCS8 may be fused off */
>-        for (int i =3D XE_HW_ENGINE_BCS1, j =3D 0; i <=3D XE_HW_ENGINE_BC=
S8; ++i, ++j) {
>+        /* Only BCS1-BCS8 may be fused off */
>+        bcs_mask <<=3D XE_HW_ENGINE_BCS1;
>+        for (int i =3D XE_HW_ENGINE_BCS1; i <=3D XE_HW_ENGINE_BCS8; ++i) =
{
>                 if (!(gt->info.engine_mask & BIT(i)))
>                         continue;
>=20
>-                if (!(BIT(j / 2) & bcs_mask)) {
>+                if (!(bcs_mask & BIT(i))) {
>                         gt->info.engine_mask &=3D ~BIT(i);
>-                        xe_gt_info(gt, "bcs%u fused off\n", j);
>+                        xe_gt_info(gt, "bcs%u fused off\n",
>+                                   i - XE_HW_ENGINE_BCS0);
>                 }
>         }
> }
>
>--=20
>2.51.0
>

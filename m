Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BA9EEC282
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 21:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8371110E298;
	Mon, 23 Feb 2026 21:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A44dZYj7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8BD10E298
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 21:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771881978; x=1803417978;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=53kKo3xy/u8bwwKcDvFi3pa9j8QjGTP7kUByJM1HdTM=;
 b=A44dZYj7Jr21xjMZoWlZy8wY3XUgQrb7nAg7E69GFIS3pfU5lhAj9wu+
 zWl3n6Ekd/T5cm1bIieLcwXCtBYY1KSpuMpxxAW7xYPIb5qB6n1AeWhvk
 bfPUWajGwGfIZK2v3Fw5/5JArYN31Xbl2dLbAs+pxVvHRiTlALNB/k40N
 XPqgZy3aEbrMVWySW9394DBnKgSKzL8GawifP1NtHRnAuAeSWEO+J1JkQ
 gaz2YddQ8UBzick4Q2Pn4U9Dz9qHAAFJhgyoW5Yc/tHRGp8hL35e1UGAu
 L4U5xjQ98ZrnuO6Gjogu23dhtdlsQ4TX6DrlwXx/UE4jaX7YcJsav2JOj g==;
X-CSE-ConnectionGUID: acmC19BlQ/SdVu8MzcpApw==
X-CSE-MsgGUID: qIUdvKqUSO+Hb5j3+gzxPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84341341"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="84341341"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:26:18 -0800
X-CSE-ConnectionGUID: jPgI1CjXSHezZQ55G0e90Q==
X-CSE-MsgGUID: llC7DIPxTaqd9M5uxTLBgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="253409497"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:26:18 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:26:17 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 13:26:17 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:26:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MM4527GcCahmAl/EGzxbmwAKzb4pCMyG3UqTXIdjuG2fmSQZ95rqJCwwYTecbOExekfLlFyHdL1Tn9Wjrs/cvcmJjhXZIMiO705sp+DXHPfDXUf9ncS7svQeo7OBJhXLSSijNJwF235uC8Ar+ZdgUWKu3urv983/u/MjXxYxAVqVvNGJxesfyS4aCt2mJiz1NgpMwsyrU+FMNaM+XZQGbE6fIAyZLcy0Mdz2T0K3zgCkADJrpfkSGev+EaJwh0wu5QJ3wX/mX0tmmf3cQ5hpg1w6Hr+KPd4TWoC/04xpSePNtMiTAfOPjs7J/UQySL9MGofZOEjlvFUAROS4WDejkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XR3AHY7TnGUM19uFW6L4YmwSX4ZXoryZATZb/kSQWYU=;
 b=awlXeXnsjswl8+Cyns1Y5XReRztjwA2JNDcgI62Y7TAaBESnZMQTJdNmmzw+UihnpfUSiGOTbgNlfTE1T9h45jNDnq2fmOtRwNH+G6LoyUTWuZYRtw8O6qaft7OiNppdVvH574NOBvDBt88W1bCHo/q3r+T6nCZc3Y9ZcOOqBPadaHvAvc1pUX9bxsgrYmCkviwq9ILBMa2rIiSVma0SYGofdDXETaEkBJfvGsTDA3pMvlsp9CmN7e6CL/x5X7pqDcM7xFXSDEaQzF2CALOr6pRVrf1xveThaFtiDjFTcb+ao1ZY0U2CXFS0qKecPpflZXQwy/Yrv5Ml22FM6TkvCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB5802.namprd11.prod.outlook.com (2603:10b6:806:235::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Mon, 23 Feb
 2026 21:26:14 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 21:26:14 +0000
Date: Mon, 23 Feb 2026 16:26:09 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [RFC PATCH 6/6] [DO NOT REVIEW]]drm/xe/cri: Add sysfs interface
 for bad gpu vram pages
Message-ID: <aZzF8X-NeDMmy9py@intel.com>
References: <20260213092552.1527799-8-tejas.upadhyay@intel.com>
 <20260213092552.1527799-14-tejas.upadhyay@intel.com>
 <aZUJy5baVacPxGM9@intel.com>
 <0ba5c665-e37b-41b5-9692-9f02f30682de@linux.intel.com>
 <943a10ec67eb0de1d050bb90eda30f0826587b1b.camel@intel.com>
 <b9935489-ddef-4cb7-8563-ed1d4fcadb88@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9935489-ddef-4cb7-8563-ed1d4fcadb88@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0206.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::31) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5228e5-3727-41e9-bc09-08de73222bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1I4L2lSSmh0Q09Uc2E0Q1pEZzBqcm43b2VaQWllQ0FvS3RMZTNYRW5YMmpn?=
 =?utf-8?B?bE91SDRpSkQ5T1d0ZTI3WVZMVCtSTU1iZmlvU0dhNGN5WjRSbEhKQjRMRCtH?=
 =?utf-8?B?UDRDaWpjQ21WOTZFQ2N3WHMySEppbTBTbk14Njd6Qml6c1cxckN0WEJlUnh0?=
 =?utf-8?B?VVVwa3VwamY4ZDVBRXZTVnIwdDlERm1GcVBvOGdmVHlvNUYraEEvdThVbEZv?=
 =?utf-8?B?eTFHeFkrRGpNbWRVYkF2M3k5OHNKV2hJUHRhRXRYSGJVcEVFdWJDakh0NmQy?=
 =?utf-8?B?VXNNUmtTeUZOVFFiWlJWWE5nU1Y2bTJSVE5zWWhKSWpURlhDd0NwdmVsMXhN?=
 =?utf-8?B?ZDJOd0dMaldOQzFVMFFhVXE3Rys5UlJhRDRRajdnbXdpRVczYTZZZjFxMHJP?=
 =?utf-8?B?U1p4bDA4eElnek1OaXpFaVFpYW1TU1JQeWl0dWFOS3JiYzU3Zi9lazBmaE5j?=
 =?utf-8?B?R2JHN1VyMTdSR2xCQndMem5iN1dRUy9OZGtsSHpDWTN6MURhbTg2SEdpVGcz?=
 =?utf-8?B?U2xBRWpLU0RKdW9EdVk1cGtxQXloKzBoczhsdHVxdWdGQTg5ejltZ0dYd3ZD?=
 =?utf-8?B?WUpQOWdlV3hSd1hodjJSUkQ5M3JwQWNCTEFSa3dGMVZXeUU5Z1FYb2d6S2ZG?=
 =?utf-8?B?TXFzU3ErNGFXODNLYW9uOTRjTEhtMzREcS9QR1pRVkVYTnE5SkF6QWF3Y0kv?=
 =?utf-8?B?K2ZJT0hXWldJdFViL3ZITWp2cHJKaXNFK3UvbGF2a3NQMmFJQkY1STBBYW1J?=
 =?utf-8?B?NXhkTjRwYkU3RlNNdWlhZ1g5eFhFZEVlZjFCREFURlM4LzFoVFJHaWdJK2dP?=
 =?utf-8?B?WUh6MnJKL1lXZmtNQ3VmNjBac3dPYXN0NGFQZmNQQWl0MWp5Y2tYK3Jxb2tr?=
 =?utf-8?B?alN0ZGo5bVFKN0M3Y1lkaUVWN21kODExbjdtWDFYUjF6L2RMK2FrbmRqNU1k?=
 =?utf-8?B?d3I1cVZQN0ZibzF1bllIZitKOTNlTk5Hck9RT1YzUmVJVGdVNS82YlhmRHIr?=
 =?utf-8?B?c3A3RTJzWFNBUFlaQlBrUlRrdE1WejVWUlJ3UStDTHdsdWkzNFUyTWUraUJj?=
 =?utf-8?B?YkxrbStCQ0E5bVRFVVlrR3o0Ym8rUE1CVkpwazlqRlNwT1JzV3QzVnN3SmRD?=
 =?utf-8?B?MW14SytxQUdKekN3SzhKbDRxQkxaS01JQy92Kzc5MlZhN0dOaDZNajloTTZu?=
 =?utf-8?B?cXpmVVIzdlpPYmg5cmFoTk1lSy9wR3ptbllMd2t2YmRQWlNuUHNuNFUzSmNz?=
 =?utf-8?B?WWRUQUhwSlVaRkdHQWhXeTRTL3BGcUdkK0E4bEhCS25EcGoyVkRabFJRdVg0?=
 =?utf-8?B?N1dWaGFjNEtHWUI3TWFCQUZCTVhoOHlHdGhseGpIbU93bWRGRG5NNHF2U3Vv?=
 =?utf-8?B?bVZxa0JsKzNxYklLQjQzbjFlWXg0R2psaTJqZWxVZUNFOXdYOUpPNi9lVVgz?=
 =?utf-8?B?bXZ5MWRGWnVEYVlNRklSajlhVEU0MlV3RkkyTVUvdk1od2o0TW9nK2tLRjd2?=
 =?utf-8?B?emxHQnAwYTErM09lR1RrVk9zcVRUVHpUWGFtMEN4M3VDb05LWFREOUg4dWNQ?=
 =?utf-8?B?QXd0TCs0TDlEaFRoNU1BWVpNQkVTeGJ3dUI0VGtwREJORlptd2g1WExLRkQ1?=
 =?utf-8?B?dTFNeTI1a25SYUJPTThrRUxiZHQ5Q2I5VGV5RVFwQ0tIUzhCSWVpQVg3QUFU?=
 =?utf-8?B?VWxmNDZHU2lTTTlDbDdhSi9SZVp5QnR1OXB6aHJRL0V4N2JGQ3NGWWJBdEN5?=
 =?utf-8?B?UGwxUEMzU0hXNUlnL2V0VWR4NzMycjVodW9qeElOMWdqWkpQQ044cHZ1WWty?=
 =?utf-8?B?SmRTMVppd3YrcloraGdyQTJXcG1iNXJRSEhHS1lpK1FsdStGWmRlK0FldkJx?=
 =?utf-8?B?Q3lQNTYybllaSURRQVRaWVloS0dMdWlncmdqelJBZGc1Tk5SVUtZRGlReWhw?=
 =?utf-8?B?YW9VY0Zhb3djc1hZNGkzZ0F3eEUzZVJOMlJ2RnJhUFRLbk5qQzl6Z2tJb1lz?=
 =?utf-8?B?MkY0NW4rbktuTENNNmluNUIzZzI1OHN3RUFnM05tV0JLakhmTzNZV3BXTmZX?=
 =?utf-8?B?cFZpMm9Fdm5zTWFWYlNHcEVpd0djNnlnR05pYlY4bzk4TkJwcUR1U3hzZjhO?=
 =?utf-8?Q?s+vo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3lCYTF6SWwzZUNNMnVtRG9xai9SZWxhK3Vyb0J2dHB5SUNqOUpyUDl2NTVK?=
 =?utf-8?B?dTQxT2Z5cWtBQ2FwV1lRZER4M0hRL2dXQWhGM01pZ25sVDR4MFF4OXEyOWNF?=
 =?utf-8?B?UU00UFhEQ0RHMEsyd2RRc0tnQ0JUN2VjWGxqSW1Jd3ZZWnpaaC9OVmlwdDZI?=
 =?utf-8?B?ZG1vSVZjenZMcVh6SjN3dGRhTlZ1V0Zya0hGSHMwRWtWZ3RNQkwyb2xNRm9M?=
 =?utf-8?B?aHZ1anEvWHRtTmg1Y2NWUGEzcjhlVFdxSWhzbjg3ZDJLN0FNSFVYNWdxSWtU?=
 =?utf-8?B?TENMVVJjTEJtRVNlSHRMd05mUWlrOUtJQXFaa0FQTzRLNjBPSFVod1Z2WGRU?=
 =?utf-8?B?YVpwZ2NBbmV5UENNc3VsNlN2SlRRc1FHZHdERG96SHBjK0VVRGl6Y1cwa0hw?=
 =?utf-8?B?S2htWDBoOEpoekpVT1V4VHk5YktVN0Jxdk5zbDRQMW9TenpHZUUyS2xRa3M5?=
 =?utf-8?B?d09IV0JWTDhSSnFoWXNreFlta0dKdXpGU3RVU3Z1c000VGhwS3JxU2ExVVZP?=
 =?utf-8?B?ZGFLMnRPZ3hidkd1Q1hVeGt1MmtIS3RwVjU1TldEaTlDQ0N6NDlURXJsSVJp?=
 =?utf-8?B?c1QzcjZ3aEhMdlNpanZxbjNxcnRzT3ZSQmdFbXdROURWcVpVQm5NZm1BK3dv?=
 =?utf-8?B?WktMa1JKTFM4OGdVWm9KdDNyRis2LzkxQ011TnRHai9wL3R4QXBOdW1yclFu?=
 =?utf-8?B?Q3A5aUtJRVE4Nk02aVdWS0tQK3BPUk9qTFk2cVBwRjdXM2tJTW1KU1gvV0hG?=
 =?utf-8?B?MkRxL1lhQXl6WkpjN2lkOE1vaStNazM3K3JCTVkwbVZBYy9hbVg2QzhvMyta?=
 =?utf-8?B?SWlrdWN6elh3Q0JpVTNyVnlwQ1plSlcrN2xTWHp0QURSSEtBM0tFTXBxVnda?=
 =?utf-8?B?UFVLTTlUY1hYMFlvcGZ0eGVLLzlYVjRwMmROQ1FkZHplUk1Wa1RqSi9WSThO?=
 =?utf-8?B?eDVNYURmQWdEUkhhSmdxMlJRWGluRkV3aUpoMVBWUU1zaE1JVlg0S0ZSWDlU?=
 =?utf-8?B?cGpocVVZVTd3dk9kb292d0NCaVFCczR3UUVPNDF0UUYwME9XQ25ES2g1Mk9m?=
 =?utf-8?B?eUF6U1laUE0yMGpMUzI0ZmltWTIzd0cxUkxPeU5JUEwwREtDckVSdDN1RzFF?=
 =?utf-8?B?aHBRWFEzSVZ6RkJCdVo5OUpQYnY1MDdZR3YyTGpUOXlVMFhDUU9tU3RNcmZm?=
 =?utf-8?B?YzJuc29wVXNEUFBxTi9lanZ0Qm84MVpzcDRBdTZNZlZ5Yzl3TnZYd1NPS2Nz?=
 =?utf-8?B?Yno4VDBIWlRzaFhCUHFRKzNoQU1ZUDVVM2l3MVMzYkxyY2Q1RzlDWXI3WjAx?=
 =?utf-8?B?V3pEWUppbms5R3lxa2lYbThjZTJZMzJDN2xsQ09DUkVuNURpUzlzK0Rxdy9M?=
 =?utf-8?B?WDV3VjZEaGExUmUvQmN5cjlrOFpablpEbWp2dGk1dUVtSXE0Mm1FUElNZ2l1?=
 =?utf-8?B?VE1QR25SMW83TnpjcHNudGw3N0FycXlUajh6Ukd3ZE1XMjhvSncxZnBlQXQx?=
 =?utf-8?B?Yk55S25uTU9HNXVUM1RrRXYvUU96NGJkOXJqUTUwUzAvU3o0c0FvbVJNOGcx?=
 =?utf-8?B?Y3o0R24rZlFQcWV5QU14SDNZY2FrM0ZoRHhmZkZlUTVHVkxBcS9WOEs4T1hE?=
 =?utf-8?B?ekVKTzNIRTkwbGRRYXFSMEhESG83aDRuWkZCZXlBZG5KazJjREc2c1pPL3Qw?=
 =?utf-8?B?dWtYazhBWDNKYW1FRk0ydTVNSUNIMlJRbzUxOUVxYnBDZndzUkg5S2dZbGJG?=
 =?utf-8?B?ek5PNUdnVFdpeWhNUmlZMHFzN29CZFR1cFUwWUNpQUwrUElLZFN2bXpXQmJD?=
 =?utf-8?B?VXkxNmduVDc4Z2tTcHpRNVJqYm1tNXNUYmM3OGlZa1ZuVUM5b0hGWXAxb2gz?=
 =?utf-8?B?dGsvQVoxUWlTT1ZCcm1sUnJySXZ4QmFyK2pET2hwMWMvUURTbXE0UGVVeWds?=
 =?utf-8?B?VHRvSkIvY2h0K1RWdVdzQWZMYzUxOGdrdkZiSmpwd1FvdjF0YUpvTkVzZ2FI?=
 =?utf-8?B?NzZidUR2bHBYQ0YrVDFTU3MvT2FGNUk0a3VtdG9PTjVvaWw3MnN5SnNjYXRv?=
 =?utf-8?B?OFdLc29CT2RQeUJBcjg5aVVCa0VNVFVXeHFQczRZQjdSZE5yUkVRd29sMEgw?=
 =?utf-8?B?QkF6L1VJOHhsRGtjaFJjc251RUZVdThGcXI2N25UaktTNkEwVytlbTNmK0ZR?=
 =?utf-8?B?aFdpQkcwL3R5WDNxZytybjNTZ0pyRTZ2cVo1MTlFbUEwWXI1d052RDNOQzJp?=
 =?utf-8?B?T0tKbGpKZHh1WnBNQ1Z6MmZ4RkFVekQxU3JBSmQwVlpBNlNYdU1mY3dRd3pm?=
 =?utf-8?B?UHpqSkkzRWkrY1VLZVJGWEZWZ2dSQmJ0MlpwWDJYQXdVTk5Ha2MxQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5228e5-3727-41e9-bc09-08de73222bf9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 21:26:13.9139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6aynVSal7tmz0Zp3z4y6aACYSqbtaeQWiDdByqecZ1XJAuIenH4GKUCL7RCT3Fq4uRhwo3hi7LEkMbYfoKDJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5802
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

On Sun, Feb 22, 2026 at 11:02:25AM +0530, Aravind Iddamsetty wrote:
> 
> On 20-02-2026 20:22, Vivi, Rodrigo wrote:
> > On Fri, 2026-02-20 at 16:48 +0530, Aravind Iddamsetty wrote:
> >> On 18-02-2026 06:07, Rodrigo Vivi wrote:
> >>> On Fri, Feb 13, 2026 at 02:55:59PM +0530, Tejas Upadhyay wrote:
> >>>> Starting CRI, Include a sysfs interface designed to expose
> >>>> information
> >>>> about bad VRAM pages—those identified as having hardware faults
> >>>> (e.g., ECC errors). This interface allows userspace tools and
> >>>> administrators to monitor the health of the GPU's local memory
> >>>> and
> >>>> track the status of page retirement.To get details on bad gpu
> >>>> vram
> >>>> pages can be found under /sys/bus/pci/devices/bdf/vram_bad_pages.
> >>>>
> >>>> Where The format is, pfn : gpu page size : flags
> >>>>
> >>>> flags:
> >>>> R: reserved, this gpu page is reserved.
> >>>> P: pending for reserve, this gpu page is marked as bad, will be
> >>>> reserved in next window of page_reserve.
> >>>> F: unable to reserve. this gpu page can’t be reserved due to some
> >>>> reasons.
> >>>>
> >>>> For example if you read using cat
> >>>> /sys/bus/pci/devices/bdf/vram_bad_pages,
> >>>> 0x00000000 : 0x00001000 : R
> >>>> 0x00001234 : 0x00001000 : P
> >>> Riana, Raag, Aravind, a good new use case for the drm-ras no?!
> >>> Thoughts?
> >> In general the feature can be supported via drm-ras framework, but is
> >> the motivation to move all error related info to drm-ras, also any
> >> gpu
> >> hang data, health etc..,
> > No, the motivation is not to move everything there.
> > I was thinking on the lines of avoiding sysfs. But well, it is only
> > one sysfs and I don't believe we would need any notification upon
> > new pages marked as bad, or do we?
> 
> I do not see a requirement to have any additional notification, as there
> would already be a notification for an uncorrectable error.

Fair enough then

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

on continuing with this sysfs entry for this case.

> 
> Thanks,
> Aravind.
> >
> > If we need notifications then sysfs is bad choice and netlink could
> > provide info and notification in a single place.
> >
> >> Thanks,
> >> Aravind.
> >>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >>>> ---
> >>>>  drivers/gpu/drm/xe/xe_device_sysfs.c |  2 +
> >>>>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 78
> >>>> ++++++++++++++++++++++++++++
> >>>>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  1 +
> >>>>  3 files changed, 81 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> >>>> b/drivers/gpu/drm/xe/xe_device_sysfs.c
> >>>> index a73e0e957cb0..e6a017601428 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> >>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> >>>> @@ -14,6 +14,7 @@
> >>>>  #include "xe_pcode_api.h"
> >>>>  #include "xe_pcode.h"
> >>>>  #include "xe_pm.h"
> >>>> +#include "xe_ttm_vram_mgr.h"
> >>>>  
> >>>>  /**
> >>>>   * DOC: Xe device sysfs
> >>>> @@ -284,6 +285,7 @@ int xe_device_sysfs_init(struct xe_device
> >>>> *xe)
> >>>>  		if (ret)
> >>>>  			return ret;
> >>>>  	}
> >>>> +	xe_ttm_vram_sysfs_init(xe);
> >>>>  
> >>>>  	return 0;
> >>>>  }
> >>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> >>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> >>>> index cb3394000e83..c6a81ccaa9d2 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> >>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> >>>> @@ -744,3 +744,81 @@ int xe_ttm_tbo_handle_addr_fault(struct
> >>>> xe_tile *tile, unsigned long addr)
> >>>>  	return ret;
> >>>>  }
> >>>>  EXPORT_SYMBOL(xe_ttm_tbo_handle_addr_fault);
> >>>> +
> >>>> +static void xe_ttm_vram_dump_bad_pages_info(char *buf, struct
> >>>> xe_ttm_vram_mgr *mgr)
> >>>> +{
> >>>> +	const unsigned int element_size = sizeof("0xabcdabcd :
> >>>> 0x12345678 : R\n") - 1;
> >>>> +	struct xe_ttm_offline_resource *pos, *n;
> >>>> +	struct drm_buddy_block *block;
> >>>> +	ssize_t s = 0;
> >>>> +
> >>>> +	mutex_lock(&mgr->lock);
> >>>> +	list_for_each_entry_safe(pos, n, &mgr->offlined_pages,
> >>>> offlined_link) {
> >>>> +		block = list_first_entry(&pos->blocks,
> >>>> +					 struct drm_buddy_block,
> >>>> +					 link);
> >>>> +		s += scnprintf(&buf[s], element_size + 1,
> >>>> +			       "0x%08llx : 0x%08llx : %1s\n",
> >>>> +			       drm_buddy_block_offset(block) >>
> >>>> PAGE_SHIFT,
> >>>> +			       drm_buddy_block_size(&mgr->mm,
> >>>> block),
> >>>> +			       "R");
> >>>> +	}
> >>>> +	list_for_each_entry_safe(pos, n, &mgr->queued_pages,
> >>>> queued_link) {
> >>>> +		block = list_first_entry(&pos->blocks,
> >>>> +					 struct drm_buddy_block,
> >>>> +					 link);
> >>>> +		s += scnprintf(&buf[s], element_size + 1,
> >>>> +			       "0x%08llx : 0x%08llx : %1s\n",
> >>>> +			       drm_buddy_block_offset(block) >>
> >>>> PAGE_SHIFT,
> >>>> +			       drm_buddy_block_size(&mgr->mm,
> >>>> block),
> >>>> +			       "P");
> >>>> +	}
> >>>> +	mutex_unlock(&mgr->lock);
> >>>> +}
> >>>> +
> >>>> +static ssize_t vram_bad_pages_show(struct device *dev, struct
> >>>> device_attribute *attr, char *buf)
> >>>> +{
> >>>> +	struct pci_dev *pdev = to_pci_dev(dev);
> >>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> >>>> +	struct ttm_resource_manager *man;
> >>>> +	u8 mem_type = XE_PL_VRAM1;
> >>>> +
> >>>> +	do {
> >>>> +		man = ttm_manager_type(&xe->ttm, mem_type);
> >>>> +		struct xe_ttm_vram_mgr *mgr =
> >>>> to_xe_ttm_vram_mgr(man);
> >>>> +
> >>>> +		if (man)
> >>>> +			xe_ttm_vram_dump_bad_pages_info(buf,
> >>>> mgr);
> >>>> +		--mem_type;
> >>>> +	} while (mem_type >= XE_PL_VRAM0);
> >>>> +
> >>>> +	return sysfs_emit(buf, "%s\n", buf);
> >>>> +}
> >>>> +static DEVICE_ATTR_RO(vram_bad_pages);
> >>>> +
> >>>> +static void xe_ttm_vram_sysfs_fini(void *arg)
> >>>> +{
> >>>> +	struct xe_device *xe = arg;
> >>>> +
> >>>> +	device_remove_file(xe->drm.dev,
> >>>> &dev_attr_vram_bad_pages);
> >>>> +}
> >>>> +
> >>>> +/**
> >>>> + * xe_ttm_vram_sysfs_init - Initialize vram sysfs component
> >>>> + * @tile: Xe Tile object
> >>>> + *
> >>>> + * It needs to be initialized after the main tile component is
> >>>> ready
> >>>> + *
> >>>> + * Returns: 0 on success, negative error code on error.
> >>>> + */
> >>>> +int xe_ttm_vram_sysfs_init(struct xe_device *xe)
> >>>> +{
> >>>> +	int err;
> >>>> +
> >>>> +	err = device_create_file(xe->drm.dev,
> >>>> &dev_attr_vram_bad_pages);
> >>>> +	if (err)
> >>>> +		return 0;
> >>>> +
> >>>> +	return devm_add_action_or_reset(xe->drm.dev,
> >>>> xe_ttm_vram_sysfs_fini, xe);
> >>>> +}
> >>>> +EXPORT_SYMBOL(xe_ttm_vram_sysfs_init);
> >>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> >>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> >>>> index 5872e8b48779..6e69140c0be8 100644
> >>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> >>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> >>>> @@ -34,6 +34,7 @@ void xe_ttm_vram_get_used(struct
> >>>> ttm_resource_manager *man,
> >>>>  int xe_ttm_tbo_handle_addr_fault(struct xe_tile *tile, unsigned
> >>>> long addr);
> >>>>  void xe_ttm_vram_dump_allocated_blocks(struct drm_device *dev,
> >>>> struct drm_buddy *mm,
> >>>>  				       struct drm_printer *p);
> >>>> +int xe_ttm_vram_sysfs_init(struct xe_device *xe);
> >>>>  static inline struct xe_ttm_vram_mgr_resource *
> >>>>  to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
> >>>>  {
> >>>> -- 
> >>>> 2.52.0
> >>>>
